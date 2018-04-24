<?php

namespace Openclassroom\blog\MVC\model;

class Manager{

	protected function connectDb(){
		try{
	        $db = new \PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '');
	        return $db;

	    } catch(Exception $e){
	        die('Erreur : '.$e->getMessage());
	    }
	}

}