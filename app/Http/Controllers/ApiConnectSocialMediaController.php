<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;
use App\Repositories\CustomerRepository;

class ApiConnectSocialMediaController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "connect_social_media";
        $this->method_type = "post";
        
        $validator['user_id'] = 'required|numeric';
        $validator['type'] = 'required|string|in:Facebook,Google';
        $validator['social_id'] = 'required|string|min:1|max:100';
        $validator['image'] = 'nullable|url';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
        $type = g('type');
        $social_id = g('social_id');
        $image = g('image');
        
        try {
            $customer = CustomerRepository::findById($user_id);
            
            if ($type == 'Facebook') {
                $check_social = CustomerRepository::findByFacebookId($social_id);
            } else {
                $check_social = CustomerRepository::findByGoogleId($social_id);
            }
            
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } elseif ($check_social->getId() != '' && $check_social->getId() != $customer->getId()) {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun ' . $type . ' anda terikat dengan akun lainnya';
                $json = response()->json($response, 400);
            } else {
                if (($customer->getFacebookId() == '' && $type == 'Facebook') || ($customer->getGoogleId() == '' && $type == 'Google')) {
                    //parse id
                    if ($type == 'Facebook') {
                        $customer->setFacebookId($social_id);
                    } else {
                        $customer->setGoogleId($social_id);
                    }
    
                    //update image
                    if ($customer->getImage() == '') {
                        $customer->setImage(Udinus::CopyImageUrl($image));
                    }
    
                    $customer->save();
                }
                
                $data['id'] = $customer->getId();
                $data['qrcode'] = Udinus::QRCode($customer->getQrcode());
                $data['image'] = Udinus::file($customer->getImage());
                $data['name'] = $customer->getName();
                $data['email'] = $customer->getEmail();
                $data['phone_code'] = $customer->getPhoneCode();
                $data['phone'] = $customer->getPhone();
                $data['saldo'] = $customer->getSaldo();
                $data['password'] = ($customer->getPassword() == '' ? 'Empty' : 'Not Empty');
                $data['pin'] = ($customer->getPin() == '' ? 'Empty' : 'Not Empty');
                $data['facebook_login'] = ($customer->getFacebookId() == '' ? FALSE : TRUE);
                $data['google_login'] = ($customer->getGoogleId() == '' ? FALSE : TRUE);
                
                $response['api_status'] = 1;
                $response['api_message'] = $type.' berhasil terhubung';
                $response['data'] = $data;
                $json = response()->json($response, 200);
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
