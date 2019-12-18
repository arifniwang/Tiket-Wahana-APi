<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class Token extends Model
{
    public static $tableName = "token";

    public static $connection = "mysql";

    
	private $id;
	private $created_at;
	private $updated_at;
	private $customer_id;
	private $regid;
	private $platform;


    
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

	public static function findAllByCustomerId($value) {
		return static::simpleQuery()->where('customer_id',$value)->get();
	}

	/**
	* @return Customer
	*/
	public function getCustomerId() {
		return Customer::findById($this->customer_id);
	}

	public function setCustomerId($customer_id) {
		$this->customer_id = $customer_id;
	}

	public static function findAllByRegid($value) {
		return static::simpleQuery()->where('regid',$value)->get();
	}

	public static function findByRegid($value) {
		return static::findBy('regid',$value);
	}

	public function getRegid() {
		return $this->regid;
	}

	public function setRegid($regid) {
		$this->regid = $regid;
	}

	public static function findAllByPlatform($value) {
		return static::simpleQuery()->where('platform',$value)->get();
	}

	public static function findByPlatform($value) {
		return static::findBy('platform',$value);
	}

	public function getPlatform() {
		return $this->platform;
	}

	public function setPlatform($platform) {
		$this->platform = $platform;
	}


}