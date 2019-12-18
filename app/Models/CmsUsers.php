<?php
namespace App\Models;

use DB;
use Crocodicstudio\Cbmodel\Core\Model;

class CmsUsers extends Model
{
    public static $tableName = "cms_users";

    public static $connection = "mysql";

    
	private $id;
	private $name;
	private $photo;
	private $email;
	private $password;
	private $id_cms_privileges;
	private $created_at;
	private $updated_at;
	private $deleted_at;
	private $status;


    
	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
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

	public static function findAllByPhoto($value) {
		return static::simpleQuery()->where('photo',$value)->get();
	}

	public static function findByPhoto($value) {
		return static::findBy('photo',$value);
	}

	public function getPhoto() {
		return $this->photo;
	}

	public function setPhoto($photo) {
		$this->photo = $photo;
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

	public static function findAllByIdCmsPrivileges($value) {
		return static::simpleQuery()->where('id_cms_privileges',$value)->get();
	}

	public static function findByIdCmsPrivileges($value) {
		return static::findBy('id_cms_privileges',$value);
	}

	public function getIdCmsPrivileges() {
		return $this->id_cms_privileges;
	}

	public function setIdCmsPrivileges($id_cms_privileges) {
		$this->id_cms_privileges = $id_cms_privileges;
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

	public static function findAllByDeletedAt($value) {
		return static::simpleQuery()->where('deleted_at',$value)->get();
	}

	public static function findByDeletedAt($value) {
		return static::findBy('deleted_at',$value);
	}

	public function getDeletedAt() {
		return $this->deleted_at;
	}

	public function setDeletedAt($deleted_at) {
		$this->deleted_at = $deleted_at;
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