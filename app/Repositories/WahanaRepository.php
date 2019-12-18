<?php

namespace App\Repositories;

use DB;
use App\Models\Wahana;

class WahanaRepository extends Wahana
{
    public static function getApi($search = '')
    {
        $data = self::simpleQuery()
            ->select('id','name','image','description','nominal','status')
            ->where(function ($q) use ($search) {
                if ($search != '') {
                    $q->where('name', 'LIKE', '%' . $search . '%');
                }
            })
            ->orderBy('name', 'ASC')
            ->get();
        foreach ($data as $row){
            $row->image = ($row->image == '' ? '' : url($row->image));
        }
        
        return $data;
    }
}
