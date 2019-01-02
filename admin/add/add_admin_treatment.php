<?php
  require '../connect_db.php';
  if (
    !empty($_POST['lastName']) && !empty($_POST['firstName'])
    && !empty($_POST['email']) && !empty($_POST['login'])
    && !empty($_POST['password']) && !empty($_POST['cpassword'])
  ) {
    if ($_POST['password'] !== $_POST['cpassword'] || !preg_match('#^[a-z0-9_.-]+@[a-z0-9_-]{2,}\.[a-z0-9_.-]{2,4}$#', $_POST['email']))
      header('Location: http://localhost/HappyFoodWebsite/admin/add/index.php?status=0');
    $query = $database->prepare(
      "INSERT INTO user(lastName, firstName, email, admin, login, password)
      VALUES(:lastName, :firstName, :email, 1, :login, :password)"
    );
    $query->execute(array(
      'lastName' => strip_tags($_POST['lastName']),
      'firstName' => strip_tags($_POST['firstName']),
      'email' => strip_tags($_POST['email']),
      'login' => strip_tags($_POST['login']),
      'password' => password_hash(strip_tags($_POST['password']),PASSWORD_BCRYPT,['cost'=>10])
    ));
    header('Location: http://localhost/HappyFoodWebsite/admin/add/index.php?status=1');
  }
  else header('Location: http://localhost/HappyFoodWebsite/admin/add/index.php?status=0');
