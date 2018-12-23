<?php
  try {
/*    $database = new PDO(
      'mysql:host=185.98.131.90:3306;dbname=happy1074118;charset=utf8',
      'happy1074118',
      'cruipdrqu7',
      array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
    );*/
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

  function getUserIdByLogin($database, $login)
  {
    $request = $database->prepare('SELECT idUser from user WHERE login = ?');
    $request->execute(array($login));
    $idUser = $request->fetch();
    return $idUser['idUser'];
  }
