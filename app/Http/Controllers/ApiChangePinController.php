<?php namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;

class ApiChangePinController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "change_pin";
        $this->method_type = "post";
        
        $validator['user_id'] = 'required|numeric';
        $validator['old_pin'] = 'required|integer|digits:6';
        $validator['new_pin'] = 'required|integer|digits:6';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
        $old_pin = g('old_pin');
        $new_pin = g('new_pin');
        
        try {
            $customer = CustomerRepository::findById($user_id);
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } else {
                if ($customer->getPin() == $old_pin || $customer->getPin() == '') {
                    $customer->setPin($new_pin);
                    $customer->save();
                    
                    $response['api_status'] = 1;
                    $response['api_message'] = 'Pin berhasil diubah';
                    $json = response()->json($response, 200);
                } else {
                    $response['api_status'] = 0;
                    $response['api_message'] = 'Pin lama yang anda masukan salah';
                    $json = response()->json($response, 400);
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
