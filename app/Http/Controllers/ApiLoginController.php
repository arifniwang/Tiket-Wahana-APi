<?php namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;
use App\Repositories\TokenRepository;
use Illuminate\Support\Str;

class ApiLoginController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "login";
        $this->method_type = "post";
        
        $validator['email'] = 'required|string|email|min:1|max:150';
        $validator['password'] = 'required|string|min:1|max:100';
        $validator['regid'] = 'required|string|min:1|max:100';
        $validator['platform'] = 'required|string|in:Android,IOS';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $email = g('email');
        $password = g('password');
        $regid = g('regid');
        $platform = g('platform');
        
        try {
            $customer = CustomerRepository::findByEmail($email);
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Email tidak terdaftar';
                $json = response()->json($response, 400);
            } elseif (md5($password) != $customer->getPassword() && $password != $customer->getForgotPassword()) {
                $response['api_status'] = 0;
                $response['api_message'] = 'Password yang anda masukan salah';
                $json = response()->json($response, 400);
            } else {
                $token = TokenRepository::findByRegid($regid);
                $token->setCustomerId($customer->getId());
                $token->setRegid($regid);
                $token->setPlatform($platform);
                $token->save();
    
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
                $response['api_message'] = 'Login Berhasil';
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
