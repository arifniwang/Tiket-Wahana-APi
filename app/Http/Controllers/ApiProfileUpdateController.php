<?php namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;
use crocodicstudio\crudbooster\helpers\CRUDBooster;

class ApiProfileUpdateController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "profile_update";
        $this->method_type = "post";
        
        $validator['user_id'] = 'required|numeric';
        $validator['name'] = 'required|string|min:1|max:150';
        $validator['phone_code'] = 'nullable|string|min:3|max:5';
        $validator['phone'] = 'nullable|numeric|digits_between:10,15';
        $validator['email'] = 'required|string|email|min:1|max:150';
        $validator['image'] = 'nullable|string';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
        $name = g('name');
        $phone_code = g('phone_code');
        $phone = g('phone');
        $email = g('email');
        $image = g('image');
        
        try {
            $customer = CustomerRepository::findById($user_id);
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } else {
                $check_email = CustomerRepository::findByEmail($email);
                $check_phone = CustomerRepository::findExistPhone($phone_code, $phone);
                
                if ($check_email->getId() != '' && $check_email->getId() != $user_id) {
                    $response['api_status'] = 0;
                    $response['api_message'] = 'Email sudah digunakan';
                    $json = response()->json($response, 400);
                } elseif ($check_phone->getId() != '' && $check_phone->getId() != $user_id) {
                    $response['api_status'] = 0;
                    $response['api_message'] = 'Telepon sudah digunakan';
                    $json = response()->json($response, 400);
                } else {
                    
                    if ($image != ''){
                        $image = CRUDBooster::uploadBase64($image);
                        $customer->setImage($image);
                    }
                    
                    $customer->setName($name);
                    $customer->setPhoneCode($phone_code);
                    $customer->setPhone($phone);
                    $customer->setEmail($email);
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
                    $data['pin'] = ($customer->getPin() == '' ? 'Empty' : 'Not Empty');
                    $data['facebook_login'] = ($customer->getFacebookId() == '' ? FALSE : TRUE);
                    $data['google_login'] = ($customer->getGoogleId() == '' ? FALSE : TRUE);
                    
                    $response['api_status'] = 1;
                    $response['api_message'] = 'Data berhasil di update';
                    $response['data'] = $data;
                    $json = response()->json($response, 200);
                }
                
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
