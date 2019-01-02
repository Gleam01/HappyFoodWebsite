<?php
  session_start();
  if (!isset($_SESSION['login'])) header('Location: http://localhost/HappyFoodWebsite/admin/');
  elseif (isset($_SESSION['login'])) {
    if (!$_SESSION['add_godson'])
      header('Location: http://localhost/HappyFoodWebsite/admin/users.php');
  }
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
  <body>
    <?php include_once 'header.php'; ?>

    <section class="row">
      <div class="mx-auto w-50">
      <?php
        include_once 'connect_db.php';
        include_once 'manage_genealogy.php';
        $idUser = getUserIdByLogin($database, $_SESSION['login']);
        $result = toWhomToAdd($database, $idUser, $_SESSION['login']);
        if(is_string($result)) echo '<p class="col-12 text-danger text-center">'. $result .'</p>';
        elseif(is_int($result))
        {
            var_dump($result);
            $user = getUserById($database, $result);?>
                <p class="col-12 text-success">
                  Après analyse optimisée de la généalogie, il serait optimable d'ajouter le filleul au parrain suivant : <br>
                  Pseudo du parrain : <?=$user['login']?> <br>
                  Nom du parrain : <?=$user['lastName']?> <br>
                  Prénom du parrain : <?=$user['firstName']?>
                </p>
            <?php } else {
            var_dump($result);
            echo "else";
          }
      ?>
      </div>
    </section>
  </body>
</html>
