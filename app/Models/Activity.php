<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class Activity extends Model
{
    public static $tableName = "activity";

    public static $connection = "mysql";

    
	private $id;
	private $created_at;
	private $updated_at;
	private $customers_id;
	private $name;
	private $type;
	private $nominal;
	private $sisa_saldo;


    
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

	public static function findAllByType($value) {
		return static::simpleQuery()->where('type',$value)->get();
	}

	public static function findByType($value) {
		return static::findBy('type',$value);
	}

	public function getType() {
		return $this->type;
	}

	public function setType($type) {
		$this->type = $type;
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

	public static function findAllBySisaSaldo($value) {
		return static::simpleQuery()->where('sisa_saldo',$value)->get();
	}

	public static function findBySisaSaldo($value) {
		return static::findBy('sisa_saldo',$value);
	}

	public function getSisaSaldo() {
		return $this->sisa_saldo;
	}

	public function setSisaSaldo($sisa_saldo) {
		$this->sisa_saldo = $sisa_saldo;
	}


}