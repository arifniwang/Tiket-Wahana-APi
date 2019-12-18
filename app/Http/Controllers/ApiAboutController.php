<?php namespace App\Http\Controllers;

use App\Helpers\Udinus;

class ApiAboutController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "cms_settings";
        $this->permalink = "about";
        $this->method_type = "get";
    }
    
    
    public function hook_before(&$postdata)
    {
        try {
            $jam_operasi['weekdays'] = '10:00 - 18:00 WIB';
            $jam_operasi['weekend'] = '10:00 - 20:00 WIB';
            
            $tiket = [
                ['name' => 'Regular', 'weekday' => 'Rp 200,000', 'weekend' => 'Rp 290,000'],
                ['name' => 'Fastrack', 'weekday' => 'Rp 200,000', 'weekend' => 'Rp 200,000'],
                ['name' => 'Premium', 'weekday' => 'Rp 450,000', 'weekend' => 'Rp 550,000'],
                ['name' => 'E-Card', 'weekday' => 'Rp 325,000', 'weekend' => 'Rp 325,000'],
                ['name' => 'Annual Pass', 'weekday' => 'Rp 325,000', 'weekend' => 'Rp 325,000']
            ];
    
            $data['description'] = 'Dunia Fantasi atau yang lebih populer dengan sebutan Dufan, pertama kali dibuka untuk umum pada 29 Agustus 1985 dan merupakan theme park pertama yang dikembangkan oleh Perseroan dan telah memiliki sertifikat ISO 9001:2015 sejak Februari 2017.Selain menjadi pusat hiburan outdoor, Dufan juga merupakan kawasan edutainment fisikia terbesar di Indonesia yang memanjakan pengunjung dengan Fantasi Keliling Dunia, melalui wahana permainan berteknologi tinggi, yang terbagi dalam 9 (Sembilan) kawasan yaitu Indonesia, Jakarta, Asia, Eropa, Amerika, Yunani, Hikayat, Kalila dan Fantasy Lights.Pada tahun 2013, Dufan menambah satu kawasan lagi yaitu kawasan dalam ruang (Indoor Dufan) yang dilengkapi dengan wahana Ice Age dan Kontiki & pada tahun 2014 dan tahun 2015 dufan menambahkan wahana hello kitty adventure dan Dufan Glow.Fasilitas umum untuk pengunjung : Free Drinking Water, Gratis pinjam Stroller Bayi dan Kursi Roda, Free Wifi, Charger Point, Toilet bersih disetiap kawasan dan wahana, Baby Care Room, Mushola dan Masjid, P3K dan Ambulance.';
            $data['jam_operasi'] = $jam_operasi;
            $data['tiket'] = $tiket;
            
            $response['api_status'] = 1;
            $response['api_message'] = 'Load data berhasil';
            $response['data'] = $data;
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
