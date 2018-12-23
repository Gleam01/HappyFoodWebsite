<?php
  try {
    $database = new PDO(
      'mysql:host=localhost:3306;dbname=HappyFood;charset=utf8',
      'root',
      'phreakerSmart[]{}',
      array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
      );
  } catch (Exception $e) {
    die('Erreur : '.$e->getMessage());
  }

  function getUserById($dao, $id)
  {
    return $dao->query('SELECT * FROM user WHERE idUser='.$id)->fetch();
  }
