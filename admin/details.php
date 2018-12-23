<?php
  session_start();
  if (!isset($_SESSION['login'])) header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/');
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
  <body>
    <?php include_once 'header.php'; ?>

    <section class="user">
      <div class="col-sm-4">
        <?php include_once 'menu.php'; ?>
      </div>
      <div class="w-50 mx-auto">
        <?php
          require_once('connect_db.php');
          if(!empty($_GET['id'])) $id = (int) $_GET['id'];
          else header('Location: users.php?mes=id_invalide');

          $get_query = $database->query("SELECT * FROM user WHERE idUser = $id");
          $user = $get_query->fetch();
          if (!$user) header('Location: users.php?mes=id_invalide');
        ?>
        <fieldset>
          <legend>Détails sur l'utilisateur sélectionné</legend>
          <h4>Nom : <?= $user['lastName'] == NULL ? "Non défini" : $user['lastName']?></h4>
          <h4>Prénom : <?= $user['firstName'] == NULL ? "Non défini" : $user['firstName']?></h4>
          <h4>Adresse E-mail : <?= $user['email'] == NULL ? "Non défini" : $user['email']?></h4>
          <h4>Sexe : <?= $user['sex'] == "M" ? "Masculin" : $user['sex'] == "F" ? "Féminin" : "Non défini" ?></h4>
          <h4>Téléphone : <?= $user['phone'] == NULL ? "Non défini" : $user['phone']?></h4>
          <h4>Date de naissance : <?= $user['birthday'] == NULL ? "Non défini" : $user['birthday']?></h4>
          <h4>Date d'inscription : <?= $user['inscriptionDate'] == NULL ? "Non défini" : $user['inscriptionDate']?></h4>
          <h4>Profession : <?= $user['job'] == NULL ? "Non défini" : $user['job']?></h4>
          <h4>Pays : <?= $user['pays'] == NULL ? "Non défini" : $user['pays']?></h4>
          <h4>Adresse : <?= $user['adress'] == NULL ? "Non défini" : $user['adress']?></h4>
        </fieldset>
      </div>
    </section>
  </body>
</html>
