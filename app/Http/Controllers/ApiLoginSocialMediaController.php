<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;
use App\Repositories\CustomerRepository;

class ApiLoginSocialMediaController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "login_social_media";
        $this->method_type = "post";
        
        $validator['type'] = 'required|string|in:Facebook,Google';
        $validator['social_id'] = 'required|string|min:1|max:100';
        $validator['image'] = 'nullable|url';
        $validator['name'] = 'nullable|string|min:1|max:150';
        $validator['email'] = 'nullable|email|min:1|max:150';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        try {
            $type = g('type');
            $social_id = g('social_id');
            $name = g('name');
            $image = g('image');
            $email = g('email');
            
            if ($type == 'Facebook') {
                $customer = CustomerRepository::findByFacebookId($social_id);
            } else {
                $customer = CustomerRepository::findByGoogleId($social_id);
            }
            
            if ($customer->getId() == '' && $email == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Login gagal #err_001';
                $json = response()->json($response, 400);
            } else {
                //create if empty
                if ($customer->getId() == '') {
                    $code = Udinus::CustomerCode();
                    $customer = CustomerRepository::findByEmail($email);
                    
                    if ($type == 'Facebook') {
                        $customer->setFacebookId($social_id);
                    } else {
                        $customer->setGoogleId($social_id);
                    }
                    $customer->setQrcode($code);
                    $customer->setName($name);
                    $customer->setImage(Udinus::CopyImageUrl($image));
                    $customer->setEmail($email);
                    $customer->setSaldo(0);
                    $customer->save();
                }
    
                $data['id'] = $customer->getId();
                $data['qrcode'] = Udinus::QRCode($customer->getQrcode());
                $data['image'] = Udinus::file($customer->getImage());
                $data['name'] = $customer->getName();
                $data['email'] = $customer->getEmail();
                $data['phone_code'] = ($customer->getPhoneCode() == '' ? '' : $customer->getPhoneCode());
                $data['phone'] = ($customer->getPhone() == '' ? '' : $customer->getPhone());
                $data['saldo'] = $customer->getSaldo();
                $data['password'] = ($customer->getPassword() == '' ? 'Empty' : 'Not Empty');
                $data['facebook_login'] = ($customer->getFacebookId() == '' ? FALSE : TRUE);
                $data['google_login'] = ($customer->getGoogleId() == '' ? FALSE : TRUE);
    
                $response['api_status'] = 1;
                $response['api_message'] = 'Login berhasil';
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
