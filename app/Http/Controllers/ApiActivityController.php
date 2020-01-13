<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;
use App\Repositories\ActivityRepository;
use App\Repositories\CustomerRepository;

class ApiActivityController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "activity";
        $this->permalink = "activity";
        $this->method_type = "get";
    
        $validator['user_id'] = 'required|numeric';
        $validator['date_start'] = 'nullable|date_format:Y-m-d';
        $validator['date_end'] = 'nullable|date_format:Y-m-d';
        $validator['type'] = 'nullable|in:Top Up,Scan';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        $user_id = g('user_id');
        $date_start = (g('date_start') != '' ? date('Y-m-d',strtotime(g('date_start'))) : '');
        $date_end = (g('date_end') != '' ? date('Y-m-d',strtotime(g('date_start'))) : '');
        $type = g('type');
        
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
