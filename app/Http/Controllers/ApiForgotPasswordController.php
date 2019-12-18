<?php namespace App\Http\Controllers;

use App\Repositories\CustomerRepository;
use App\Helpers\Udinus;
use Illuminate\Support\Str;

class ApiForgotPasswordController extends \crocodicstudio\crudbooster\controllers\ApiController
{
    
    function __construct()
    {
        $this->table = "customer";
        $this->permalink = "forgot_password";
        $this->method_type = "post";
        
        $validator['email'] = 'required|string|email|min:1|max:150';
        Udinus::Validator($validator);
    }
    
    
    public function hook_before(&$postdata)
    {
        try {
            $customer = CustomerRepository::findByEmail(g('email'));
            if ($customer->getId() == '') {
                $response['api_status'] = 0;
                $response['api_message'] = 'Email tidak terdaftar';
                $json = response()->json($response, 400);
            } else {
                if($customer->getForgotPassword() == ''){
                    $password = strtoupper(Str::random(6));
                    $customer->setForgotPassword($password);
                    $customer->save();
                }
    
                /**
                 * BELUM ADA FUNGSI SEND EMAIL
                 */
                $send_email = false;
                
                $response['api_status'] = 1;
                $response['api_message'] = 'Forgot password berhasil, silahkan cek email anda';
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
