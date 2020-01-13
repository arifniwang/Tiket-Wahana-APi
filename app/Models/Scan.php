<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class Scan extends Model
{
    public static $tableName = "scan";

    public static $connection = "mysql";

    
	private $id;
	private $created_at;
	private $updated_at;
	private $scan_code;
	private $customers_id;
	private $activity_id;
	private $wahana_id;
	private $nominal;


    
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

	public static function findAllByScanCode($value) {
		return static::simpleQuery()->where('scan_code',$value)->get();
	}

	public static function findByScanCode($value) {
		return static::findBy('scan_code',$value);
	}

	public function getScanCode() {
		return $this->scan_code;
	}

	public function setScanCode($scan_code) {
		$this->scan_code = $scan_code;
	}

	public static function findAllByCustomersId($value) {
		return static::simpleQuery()->where('customers_id',$value)->get();
	}

	public static function findByCustomersId($value) {
		return static::findBy('customers_id',$value);
	}

	public function getCustomersId() {
		return $this->customers_id;
	}

	public function setCustomersId($customers_id) {
		$this->customers_id = $customers_id;
	}

	public static function findAllByActivityId($value) {
		return static::simpleQuery()->where('activity_id',$value)->get();
	}

	public static function findByActivityId($value) {
		return static::findBy('activity_id',$value);
	}

	public function getActivityId() {
		return $this->activity_id;
	}

	public function setActivityId($activity_id) {
		$this->activity_id = $activity_id;
	}

	public static function findAllByWahanaId($value) {
		return static::simpleQuery()->where('wahana_id',$value)->get();
	}

	/**
	* @return Wahana
	*/
	public function getWahanaId() {
		return Wahana::findById($this->wahana_id);
	}

	public function setWahanaId($wahana_id) {
		$this->wahana_id = $wahana_id;
	}

	public static function findAllByNominal($value) {
		return static::simpleQuery()->where('nominal',$value)->get();
	}

	public static function findByNominal($value) {
		return static::findBy('nominal',$value);
	}

	public function getNominal() {
		return $this->nominal;
	}

	public function setNominal($nominal) {
		$this->nominal = $nominal;
	}


}