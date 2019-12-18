<?php

namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;

class ApiRegisterController extends \crocodicstudio\crudbooster\controllers\ApiController
{

    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "register";
        $this->method_type = "post";

        $validator['name'] = 'required|string|min:1|max:150';
        $validator['phone_code'] = 'required|string|min:3|max:5';
        $validator['phone'] = 'required|numeric|digits_between:10,15';
        $validator['email'] = 'required|string|email|min:1|max:150';
        $validator['password'] = 'required|string|min:1|max:100';
        Udinus::Validator($validator);
    }

    public function hook_before(&$postdata)
    {
        try {
            header('Access-Control-Allow-Origin: *');
            $email = str_replace(' ', '', g('email'));
            $phone = str_replace(' ', '', g('phone'));

            $customer = CustomerRepository::findExist($email, $phone);
            if ($customer->getId() != '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Email/Telepon sudah terdaftar';
                $json = response()->json($response, 400);
            } else {
                $code = Udinus::CustomerCode();
                $qrcode = Udinus::QRCode($code);

                $customer->setQrcode($code);
                $customer->setName(g('name'));
                $customer->setEmail(g('email'));
                $customer->setPhone(g('phone'));
                $customer->setPhoneCode(g('phone_code'));
                $customer->setPassword(md5(g('password')));
                $customer->setSaldo(0);
                //                $customer->save();

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
                $response['api_message'] = 'Register berhasil';
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
