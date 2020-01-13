<?php
namespace App\Repositories;

use DB;
use App\Models\Activity;

class ActivityRepository extends Activity
{
    public static function getHome($user_id)
    {
        $activity = self::simpleQuery()
            ->select('id','created_at','name','type','nominal','sisa_saldo')
            ->where('customers_id',$user_id)
            ->whereDate('created_at',date('Y-m-d'))
            ->get();
        foreach ($activity as $row){
            $row->created_at = date('d M Y, H:i',strtotime($row->created_at));
            $row->nominal = 'Rp '.number_format($row->nominal,2,',','.');
            $row->sisa_saldo = 'Rp '.number_format($row->sisa_saldo,2,',','.');
        }
        
        return $activity;
    }
    
    public static function getAll($user_id)
    {
        $activity = self::simpleQuery()
            ->select('id','created_at','name','type','nominal','sisa_saldo')
            ->where('customers_id',$user_id)
            ->get();
        foreach ($activity as $row){
            $row->created_at = date('d M Y, H:i',strtotime($row->created_at));
            $row->nominal = 'Rp '.number_format($row->nominal,2,',','.');
            $row->sisa_saldo = 'Rp '.number_format($row->sisa_saldo,2,',','.');
        }
        
        return $activity;
    }
}
