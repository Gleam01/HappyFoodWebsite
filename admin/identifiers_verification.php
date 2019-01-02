<?php
  session_start();
  require 'connect_db.php';
  if (!empty($_POST['login']) && !empty($_POST['password'])) {
    $login = strip_tags($_POST['login']);
    $password = strip_tags($_POST['password']);
    $query = $database->prepare('SELECT login, password, admin FROM user WHERE login=?');
    $query->execute(array($login));
    $data = $query->fetch();
    if (!$data) header('Location: http://localhost/HappyFoodWebsite/admin/index.php?status=0');
    if (password_verify($password, $data['password']) && $data['admin'] == 1) {
      $_SESSION['login'] = $data['login'];
      $_SESSION['role'] = ($data['login'] == 'admin1' || $data['login'] == 'SmartDev') ? 1 : 0;
      $_SESSION['add_godson'] = ($data['login'] == 'admin1' || $data['login'] == 'admin2' || $data['login'] == 'admin3') ? true : false;
      header('Location: users.php');
    }
    else header('Location: http://localhost/HappyFoodWebsite/admin/index.php?status=0');
  }
  else header('Location: http://localhost/HappyFoodWebsite/admin/index.php?status=0');
