<?php
session_start();
require '../connect_db.php';

if(isset($_POST['recup_submit'], $_POST['recup_mail'])) {
  if(!empty($_POST['recup_mail'])) {
    $recup_mail = htmlspecialchars($_POST['recup_mail']);
    if(filter_var($recup_mail, FILTER_VALIDATE_EMAIL)) {
      $mailexist = $database->prepare('SELECT id,login FROM user WHERE email = ?');
      $mailexist->execute(array($recup_mail));
      $mailexist_count = $mailexist->rowCount();
      if($mailexist_count == 1) {
        $pseudo = $mailexist->fetch();
        $pseudo = $pseudo['login'];

        $_SESSION['recup_mail'] = $recup_mail;
        $recup_code = "";
        for($i=0; $i < 8; $i++) {
          $recup_code .= mt_rand(0,9);
        }
        $mail_recup_exist = $database->prepare('SELECT id FROM recuperation WHERE mail = ?');
        $mail_recup_exist->execute(array($recup_mail));
        $mail_recup_exist = $mail_recup_exist->rowCount();
        if($mail_recup_exist == 1) {
          $recup_insert = $database->prepare('UPDATE recuperation SET code = ? WHERE mail = ?');
          $recup_insert->execute(array($recup_code, $recup_mail));
        }
        else {
          $recup_insert = $database->prepare('INSERT INTO recuperation(mail, code) VALUES (?, ?)');
          $recup_insert->execute(array($recup_mail,$recup_code));
        }

        $header="MIME-Version: 1.0\r\n";
        $header.='happyfoodforlife.net/admin"<support@happyfoodforlife.net>'."\n";
        $header.='Content-Type:text/html; charset="utf-8"'."\n";
        $header.='Content-Transfer-Encoding: 8bit';
        $message = '
        <html>
          <head>
            <title>Récupération de mot de passe - happyfoodforlife.net/admin</title>
            <meta charset="utf-8" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
          </head>
          <body>
            <div class="container">
              <div class="row">
                <p class="text-center">
                  Bonjour <b>'.$pseudo.'</b>,
                  <br>Voici votre code de récupération: <b>'.$recup_code.'</b>
                  <br>A bientôt sur <a href="happyfoodforlife.net/admin">MinDo-Consultants -- Back-End</a> !
                  <br>Ceci est un email automatique, merci de ne pas y répondre
                </p>
              </div>
            </div>
          </body>
        </html>';
        mail($recup_mail, "Récupération de mot de passe - happyfoodforlife.com/admin", $message, $header);
        header("Location: http://localhost/HappyFoodWebsite/admin/password-recovery/index.php?section=code");
      }
      else {
        $error = "Cette adresse mail n'est pas enregistrée";
      }
    }
    else {
      $error = "Adresse mail invalide";
    }
  }
  else {
      $error = "Veuillez entrer votre adresse mail";
   }
}

if(isset($_POST['verif_submit'],$_POST['verif_code'])) {
  if(!empty($_POST['verif_code'])) {
    $verif_code = htmlspecialchars($_POST['verif_code']);
    $verif_req = $database->prepare('SELECT id FROM recuperation WHERE mail = ? AND code = ?');
    $verif_req->execute(array($_SESSION['recup_mail'],$verif_code));
    $verif_req = $verif_req->rowCount();
    if($verif_req == 1) {
      $up_req = $database->prepare('UPDATE recuperation SET confirme = 1 WHERE mail = ?');
      $up_req->execute(array($_SESSION['recup_mail']));
      header('Location: http://localhost/HappyFoodWebsite/admin/password-recovery/index.php?section=changemdp');
    }
    else {
      $error = "Code invalide";
    }
  }
  else {
    $error = "Veuillez entrer votre code de confirmation";
  }
}

if(isset($_POST['change_submit'])) {
  if(isset($_POST['change_mdp'],$_POST['change_mdpc'])) {
    $verif_confirme = $database->prepare('SELECT confirme FROM recuperation WHERE mail = ?');
    $verif_confirme->execute(array($_SESSION['recup_mail']));
    $verif_confirme = $verif_confirme->fetch();
    $verif_confirme = $verif_confirme['confirme'];
    if($verif_confirme == 1) {
      $mdp = htmlspecialchars($_POST['change_mdp']);
      $mdpc = htmlspecialchars($_POST['change_mdpc']);
      if(!empty($mdp) AND !empty($mdpc)) {
        if($mdp == $mdpc) {
          $ins_mdp = $database->prepare('UPDATE user SET password = ? WHERE email = ?');
          $ins_mdp->execute(array(password_hash(strip_tags($mdp), PASSWORD_DEFAULT), $_SESSION['recup_mail']));
          $del_req = $database->prepare('DELETE FROM recuperation WHERE mail = ?');
          $del_req->execute(array($_SESSION['recup_mail']));
          header('Location: http://localhost/HappyFoodWebsite/admin/password-recovery/index.php');
        }
        else {
          $error = "Vos mots de passes ne correspondent pas";
        }
      }
      else {
        $error = "Veuillez remplir tous les champs";
      }
    }
    else {
      $error = "Veuillez valider votre mail grâce au code de vérification qui vous a été envoyé par mail";
    }
  }
  else {
    $error = "Veuillez remplir tous les champs";
  }
}
?>
<!-- Partie HTML-->
<html>
  <head>
    <meta charset="utf-8">
    <title> Récupération de mot de passe administrateur</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/admin.css">
  </head>
  <body>
    <div class="container">
      <header id="default" class="row bg-light">
        <h1 class="col-sm-4"> <span style="color: #1BBD36">HAPPY</span>FOOD </h1>
        <h1 class="col-sm-8 text-right">
          BACK - END <span style="color: #1BBD36">PANEL</span>
        </h1>
      </header>
        <h1 class="text-center text-light " style="background-color: #1BBD36;">Récupération de mot de passe</h1><br>
        <?php
          $section = '';
          if (isset($_GET['section'])) {
            $section = $_GET['section'];
          }
          if($section == 'code') { ?>
            <h2>Un code de vérification vous a été envoyé par mail: <?= $_SESSION['recup_mail'] ?></h2>
            <br/>
            <div class="w-50 mx-auto">
              <form method="post" class="row">
                <div class="form-group">
                  <input type="text" placeholder="Code de vérification" class="form-control" name="verif_code"/><br>
                  <input type="submit" style="background-color: #1BBD36; color: #CCC;"class="btn" value="Valider" name="verif_submit"/>
                </div>
              </form>
            </div>
        <?php } elseif($section == "changemdp") { ?>
          <h2 class="text-center">Nouveau mot de passe pour :</h2><?= $_SESSION['recup_mail'] ?>
          <div class="w-50 mx-auto">
            <form method="post" class="row">
              <div class="form-group">
                <input type="password" class="form-control" placeholder="Nouveau mot de passe" name="change_mdp"/><br/>
                <input type="password" class="form-control" placeholder="Confirmation du mot de passe" name="change_mdpc"/><br/>
                <input type="submit" value="Valider" name="change_submit" style="background-color: #1BBD36; color: #CCC;"class="btn"/>
              </div>
            </form>
          </div>
        <?php } else { ?>
          <div class="w-50 mx-auto">
            <form method="post" class="row">
              <div class="form-group">
                <input type="email" placeholder="Votre adresse mail" class="form-control" name="recup_mail"/><br/>
                <input type="submit" value="Valider" name="recup_submit" style="background-color: #1BBD36; color: #CCC;"class="btn"/>
              </div>
            </form>
          </div>
        <?php } ?>
        <?php
        if(isset($error)) { ?>
          <div class="w-50 mx-auto text-center alert alert-dimissable alert-danger">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <?=$error ?>
          </div>
   <?php } ?>
      </div>
  </body>
</html>
