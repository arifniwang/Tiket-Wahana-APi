<?php namespace App\Http\Controllers;

use App\Repositories\ActivityRepository;
use App\Repositories\CustomerRepository;
use App\Repositories\ScanRepository;
use App\Repositories\WahanaRepository;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\DB;
use crocodicstudio\crudbooster\helpers\CRUDBooster;
use App\Helpers\Udinus;

class ApiScanController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "activity";
        $this->permalink = "scan";
        $this->method_type = "post";
    
        $validator['user_id'] = 'required|numeric';
        $validator['wahana_id'] = 'required|numeric';
        $validator['qrcode'] = 'required|string|min:1|max:150';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        try{
            $user_id = g('user_id');
            $wahana_id = g('wahana_id');
            $qrcode = g('qrcode');
    
            $customer = CustomerRepository::findById($user_id);
            $wahana = WahanaRepository::findById($wahana_id);
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Akun anda tidak ditemukan, silahkan login kembali';
                $json = response()->json($response, 401);
            } elseif ($wahana->getId() == '' || $wahana->getStatus() != 'Buka'){
                $response['api_status'] = 0;
                $response['api_message'] = 'Wahana tidak ditemukan';
                $json = response()->json($response, 401);
            } elseif ($customer->getSaldo() < $wahana->getNominal()){
                $response['api_status'] = 0;
                $response['api_message'] = 'Saldo Anda tidak mencukupi';
                $response['saldo'] = $customer->getSaldo();
                $json = response()->json($response, 200);
            } else {
                $sisa_saldo = $customer->getSaldo() - $wahana->getNominal();

                $activity = new ActivityRepository();
                $activity->setCustomersId($customer->getId());
                $activity->setName($wahana->getName());
                $activity->setType('Scan');
                $activity->setNominal($wahana->getNominal());
                $activity->setSisaSaldo($sisa_saldo);
                $activity->save();
                
                $scan = new ScanRepository();
                $scan->setScanCode($qrcode);
                $scan->setCustomersId($customer->getId());
                $scan->setActivityId($activity->getId());
                $scan->setWahanaId($wahana->getId());
                $scan->setNominal($wahana->getNominal());
                $scan->save();
                
                $customer->setSaldo($sisa_saldo);
                $customer->save();
    
                $response['api_status'] = 1;
                $response['api_message'] = 'Transaksi berhasil, silahkan masuk';
                $response['saldo'] = $customer->getSaldo();
                $json = response()->json($response, 200);
            }
        }catch (\Exception $e){
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
