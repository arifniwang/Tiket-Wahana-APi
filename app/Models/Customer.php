<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class Customer extends Model
{
    public static $tableName = "customer";

    public static $connection = "mysql";

    
	private $id;
	private $created_at;
	private $updated_at;
	private $qrcode;
	private $name;
	private $image;
	private $phone_code;
	private $phone;
	private $email;
	private $password;
	private $forgot_password;
	private $pin;
	private $saldo;
	private $facebook_id;
	private $google_id;


    
	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	public static function findAllByCreatedAt($value) {
		return static::simpleQuery()->where('created_at',$value)->get();
	}

	public static function findByCreatedAt($value) {
		return static::findBy('created_at',$value);
	}

	public function getCreatedAt() {
		return $this->created_at;
	}

	public function setCreatedAt($created_at) {
		$this->created_at = $created_at;
	}

	public static function findAllByUpdatedAt($value) {
		return static::simpleQuery()->where('updated_at',$value)->get();
	}

	public static function findByUpdatedAt($value) {
		return static::findBy('updated_at',$value);
	}

	public function getUpdatedAt() {
		return $this->updated_at;
	}

	public function setUpdatedAt($updated_at) {
		$this->updated_at = $updated_at;
	}

	public static function findAllByQrcode($value) {
		return static::simpleQuery()->where('qrcode',$value)->get();
	}

	public static function findByQrcode($value) {
		return static::findBy('qrcode',$value);
	}

	public function getQrcode() {
		return $this->qrcode;
	}

	public function setQrcode($qrcode) {
		$this->qrcode = $qrcode;
	}

	public static function findAllByName($value) {
		return static::simpleQuery()->where('name',$value)->get();
	}

	public static function findByName($value) {
		return static::findBy('name',$value);
	}

	public function getName() {
		return $this->name;
	}

	public function setName($name) {
		$this->name = $name;
	}

	public static function findAllByImage($value) {
		return static::simpleQuery()->where('image',$value)->get();
	}

	public static function findByImage($value) {
		return static::findBy('image',$value);
	}

	public function getImage() {
		return $this->image;
	}

	public function setImage($image) {
		$this->image = $image;
	}

	public static function findAllByPhoneCode($value) {
		return static::simpleQuery()->where('phone_code',$value)->get();
	}

	public static function findByPhoneCode($value) {
		return static::findBy('phone_code',$value);
	}

	public function getPhoneCode() {
		return $this->phone_code;
	}

	public function setPhoneCode($phone_code) {
		$this->phone_code = $phone_code;
	}

	public static function findAllByPhone($value) {
		return static::simpleQuery()->where('phone',$value)->get();
	}

	public static function findByPhone($value) {
		return static::findBy('phone',$value);
	}

	public function getPhone() {
		return $this->phone;
	}

	public function setPhone($phone) {
		$this->phone = $phone;
	}

	public static function findAllByEmail($value) {
		return static::simpleQuery()->where('email',$value)->get();
	}

	public static function findByEmail($value) {
		return static::findBy('email',$value);
	}

	public function getEmail() {
		return $this->email;
	}

	public function setEmail($email) {
		$this->email = $email;
	}

	public static function findAllByPassword($value) {
		return static::simpleQuery()->where('password',$value)->get();
	}

	public static function findByPassword($value) {
		return static::findBy('password',$value);
	}

	public function getPassword() {
		return $this->password;
	}

	public function setPassword($password) {
		$this->password = $password;
	}

	public static function findAllByForgotPassword($value) {
		return static::simpleQuery()->where('forgot_password',$value)->get();
	}

	public static function findByForgotPassword($value) {
		return static::findBy('forgot_password',$value);
	}

	public function getForgotPassword() {
		return $this->forgot_password;
	}

	public function setForgotPassword($forgot_password) {
		$this->forgot_password = $forgot_password;
	}

	public static function findAllByPin($value) {
		return static::simpleQuery()->where('pin',$value)->get();
	}

	public static function findByPin($value) {
		return static::findBy('pin',$value);
	}

	public function getPin() {
		return $this->pin;
	}

	public function setPin($pin) {
		$this->pin = $pin;
	}

	public static function findAllBySaldo($value) {
		return static::simpleQuery()->where('saldo',$value)->get();
	}

	public static function findBySaldo($value) {
		return static::findBy('saldo',$value);
	}

	public function getSaldo() {
		return $this->saldo;
	}

	public function setSaldo($saldo) {
		$this->saldo = $saldo;
	}

	public static function findAllByFacebookId($value) {
		return static::simpleQuery()->where('facebook_id',$value)->get();
	}

	public static function findByFacebookId($value) {
		return static::findBy('facebook_id',$value);
	}

	public function getFacebookId() {
		return $this->facebook_id;
	}

	public function setFacebookId($facebook_id) {
		$this->facebook_id = $facebook_id;
	}

	public static function findAllByGoogleId($value) {
		return static::simpleQuery()->where('google_id',$value)->get();
	}

	public static function findByGoogleId($value) {
		return static::findBy('google_id',$value);
	}

	public function getGoogleId() {
		return $this->google_id;
	}

	public function setGoogleId($google_id) {
		$this->google_id = $google_id;
	}


}