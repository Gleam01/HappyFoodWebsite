<?php
  require 'connect_db.php';
  require 'manage_genealogy.php';
  if ( !empty($_POST['code']) && !empty($_POST['lastName'])
    && !empty($_POST['firstName']) && !empty($_POST['login'])
    && !empty($_POST['password']) && !empty($_POST['cpassword'])
    && !empty($_POST['phone']) && $_POST['password'] !== $_POST['cpassword']
    && !empty($_POST['parrain_user_id']))
    {
      $lastName = strip_tags($_POST['lastName']);
      $firstName = strip_tags($_POST['firstName']);
      $code = strip_tags($_POST['code']);
      $login = strip_tags($_POST['login']);
      $password = strip_tags($_POST['password']);
      $phone = strip_tags($_POST['phone']);
      $id_parrain = strip_tags($_POST['parrain_user_id']);
      $result = insertFilleul($database, $id_parrain, $code, $login, $password, $lastName, $firstName, $phone, 0);
    //   if($result == 0)
       header('Location: godson_add_form.php?status=1');
    //   else
    //    header('Location: godson_add_form.php?status=0');
  }
  else header('Location: godson_add_form.php?status=0');
