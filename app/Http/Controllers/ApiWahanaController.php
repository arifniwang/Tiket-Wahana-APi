<?php namespace App\Http\Controllers;


use App\Helpers\Udinus;
use App\Repositories\WahanaRepository;

class ApiWahanaController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "wahana";
        $this->permalink = "wahana";
        $this->method_type = "get";
    
        $validator['search'] = 'nullable|string';
        Udinus::Validator($validator);
    }
    
    public function hook_before(&$postdata)
    {
        try {
            $response['api_status'] = 1;
            $response['api_message'] = 'Load data berhasil';
            $response['data'] = WahanaRepository::getApi(g('search'));
            $json = response()->json($response, 200);
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
