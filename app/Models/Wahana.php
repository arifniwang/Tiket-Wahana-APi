<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class Wahana extends Model
{
    public static $tableName = "wahana";

    public static $connection = "mysql";

    
	private $id;
	private $created_at;
	private $updated_at;
	private $qrcode;
	private $image;
	private $name;
	private $description;
	private $nominal;
	private $status;


    
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

	public static function findAllByDescription($value) {
		return static::simpleQuery()->where('description',$value)->get();
	}

	public static function findByDescription($value) {
		return static::findBy('description',$value);
	}

	public function getDescription() {
		return $this->description;
	}

	public function setDescription($description) {
		$this->description = $description;
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

	public static function findAllByStatus($value) {
		return static::simpleQuery()->where('status',$value)->get();
	}

	public static function findByStatus($value) {
		return static::findBy('status',$value);
	}

	public function getStatus() {
		return $this->status;
	}

	public function setStatus($status) {
		$this->status = $status;
	}


}