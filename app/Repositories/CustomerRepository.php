<?php

namespace App\Repositories;

use DB;
use App\Models\Customer;

class CustomerRepository extends Customer
{
    public static function findExist($email, $phone)
    {
        $check = self::simpleQuery()
            ->orWhere('email', $email)
            ->orWhere('phone', $phone)
            ->first();
        
        return new static($check);
    }
    
    public static function getMaxCustomerCode($code_like = '')
    {
        if ($code_like == '') {
            $check = 'CS' . date('y');
        } else {
            $check = $code_like;
        }
        
        $data = self::simpleQuery()
            ->where('qrcode', 'LIKE', $check . '%')
            ->first();
        
        return new static($data);
    }
    
    public static function findExistPhone($phone_code, $phone_number)
    {
        $data = self::simpleQuery()
            ->where('phone_code', $phone_code)
            ->where('phone', $phone_number)
            ->first();
        
        return new static($data);
    }
}
