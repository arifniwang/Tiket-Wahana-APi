<?php namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;

class ApiProfileController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "profile";
        $this->method_type = "get";
    
        $validator['user_id'] = 'required|numeric';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
    
        try {
            $customer = CustomerRepository::findById($user_id);
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun tidak ditemukan, Silahkan login kembali';
                $json = response()->json($response, 401);
            } else {
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
                $response['api_message'] = 'Load data berhasil';
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
