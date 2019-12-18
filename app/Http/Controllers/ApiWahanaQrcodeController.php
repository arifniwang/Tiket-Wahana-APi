<?php namespace App\Http\Controllers;


use App\Helpers\Udinus;
use App\Repositories\WahanaRepository;

class ApiWahanaQrcodeController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "wahana";
        $this->permalink = "wahana_qrcode";
        $this->method_type = "get";
        
        $validator['qrcode'] = 'required|string';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        try {
            $qrcode = 'uploads/qrcode/' . g('qrcode') . '.png';
            $wahana = WahanaRepository::findByQrcode($qrcode);
            if ($wahana->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Wahana tidak ditemukan';
                $json = response()->json($response, 400);
            } elseif ($wahana->getStatus() != 'Buka') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Wahana tidak dibuka';
                $json = response()->json($response, 400);
            } else {
                $data['id'] = $wahana->getId();
                $data['name'] = $wahana->getName();
                $data['image'] = Udinus::file($wahana->getImage());
                $data['nominal'] = $wahana->getNominal();
                
                $response['api_status'] = 1;
                $response['api_message'] = 'Wahan ditemukan';
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
