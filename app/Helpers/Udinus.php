<?php

namespace App\Helpers;

use App\Repositories\CustomerRepository;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class Udinus
{
    public static function CustomerCode()
    {
        $code = 'CS' . date('y');
        $data = CustomerRepository::getMaxCustomerCode($code);
        if ($data->getId() == '') {
            $code .= '00001';
        } else {
            $number = (int)str_replace($code, '', $data->getQrcode());
            $number += 1;
            $code .= sprintf("%05s", $number);
        }
        
        return $code;
    }
    
    public static function QRCode($kode)
    {
        $base = 'http://chart.googleapis.com/chart?chs=300x300&chld=L|0&cht=qr&chl=' . $kode;
        $path = 'uploads/qrcode/' . $kode . '.png';
        $file = Udinus::file($path);
        
        if ($file == '') {
            $qr = file_get_contents($base);
            Storage::put($path, $qr);
            $file = url($path);
        }
        
        return $file;
    }
    
    public static function CopyImageUrl($url = '', $path = 'thumbnails')
    {
        if ($url == '') {
            $image = null;
        } else {
            $image = file_get_contents($url);
            $extension = pathinfo(parse_url($url, PHP_URL_PATH), PATHINFO_EXTENSION);
            $filename = pathinfo(parse_url($url, PHP_URL_PATH), PATHINFO_BASENAME);
            $list_valid = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG'];
            $file_path = 'uploads/' . $path;
            
            if (in_array($extension, $list_valid)) {
                //Create Directory Monthly
                Storage::makeDirectory($file_path);
                Storage::put($file_path . '/' . $filename, $image);
                $image = $file_path . '/' . $filename;
                
            } else {
                $image = null;
            }
        }
        
        return $image;
    }
    
    public static function file($path = null)
    {
        if ($path == null) {
            return '';
        } else {
            $check = storage_path('app/' . $path);
            if (file_exists($check)) {
                return url($path);
            } else {
                return '';
            }
        }
    }
    
    public static function Validator($data = [])
    {
        $validator = Validator::make(Request::all(), $data);
        if ($validator->fails()) {
            $result = array();
            $message = $validator->errors();
            $result['api_status'] = 0;
            $result['api_message'] = $message->all(':message')[0];
            $res = response()->json($result, 400);
            $res->send();
            exit;
        }
    }
}
