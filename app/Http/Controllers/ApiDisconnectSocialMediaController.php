<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;
use App\Repositories\CustomerRepository;

class ApiDisconnectSocialMediaController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "disconnect_social_media";
        $this->method_type = "post";
        
        $validator['user_id'] = 'required|numeric';
        $validator['type'] = 'required|string|in:Facebook,Google';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
        $type = g('type');
        
        try {
            $customer = CustomerRepository::findById($user_id);
            
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } else {
                if ($type == 'Facebook') {
                    $customer->setFacebookId(NULL);
                } else {
                    $customer->setGoogleId(NULL);
                }
                $customer->save();
                
                $data['id'] = $customer->getId();
                $data['qrcode'] = Udinus::QRCode($customer->getQrcode());
                $data['image'] = Udinus::file($customer->getImage());
                $data['name'] = $customer->getName();
                $data['email'] = $customer->getEmail();
                $data['phone_code'] = $customer->getPhoneCode();
                $data['phone'] = $customer->getPhone();
                $data['saldo'] = $customer->getSaldo();
                $data['password'] = ($customer->getPassword() == '' ? 'Empty' : 'Not Empty');
                $data['facebook_login'] = ($customer->getFacebookId() == '' ? FALSE : TRUE);
                $data['google_login'] = ($customer->getGoogleId() == '' ? FALSE : TRUE);
                
                $response['api_status'] = 1;
                $response['api_message'] = 'Berhasil menghapus ' . $type;
                $response['data'] = $data;
                $json = response()->json($response, 400);
                
            }
        } catch (\Exception $e) {
            $response['api_status'] = 0;
            $response['api_message'] = $e->getMessage();
            $json = response()->json($response, 500);
        }
        
        $json->send();
        exit();
    }
    
    public function hook_query(&$query)
    {
        //This method is to customize the sql query
        
    }
    
    public function hook_after($postdata, &$result)
    {
        //This method will be execute after run the main process
        
    }
    
}
