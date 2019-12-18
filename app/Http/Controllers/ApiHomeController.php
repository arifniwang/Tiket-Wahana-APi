<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;
use App\Repositories\CustomerRepository;

class ApiHomeController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "activity";
        $this->permalink = "home";
        $this->method_type = "get";
        
        $validator['user_id'] = 'required|numeric';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        try {
            $customer = CustomerRepository::findById(g('user_id'));
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } else {
                $response['api_status'] = 1;
                $response['api_message'] = 'Load data berhasil';
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
