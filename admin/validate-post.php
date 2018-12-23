<?php
  session_start();
  function logout()
  {
      $_SESSION = array();

      // Si vous voulez détruire complètement la session, effacez également
      // le cookie de session.
      // Note : cela détruira la session et pas seulement les données de session !
      if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
          $params["path"], $params["domain"],
          $params["secure"], $params["httponly"]
        );
      }
      session_destroy();
  }

  require 'connect_db.php';
  if (isset($_POST['password'])) {
    $password = strip_tags($_POST['password']);
    $query = $database->prepare('SELECT login, password FROM user WHERE login=?');
    $query->execute(array($_SESSION['login']));
    $data = $query->fetch();
    var_dump($data);
    if ($data) {
      if (password_verify($password, $data['password'])) {
        header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/codes.php');
      }
      else {
        logout();
        header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/index.php?status=-1');
      }
    }
    else {
      logout();
      header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/index.php?status=-1');
    }
  }
  else header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/validate.php?status=0');
?>
