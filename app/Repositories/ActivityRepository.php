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
        }
        
        return $activity;
    }
}
