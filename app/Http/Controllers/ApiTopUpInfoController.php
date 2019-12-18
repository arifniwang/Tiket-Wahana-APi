<?php namespace App\Http\Controllers;

class ApiTopUpInfoController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "cms_settings";
        $this->permalink = "top_up_info";
        $this->method_type = "get";
    }
    
    public function hook_before(&$postdata)
    {
        try {
            $response['api_status'] = 1;
            $response['api_message'] = 'Load data berhasil';
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
