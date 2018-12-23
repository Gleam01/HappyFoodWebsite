<?php
  session_start();
  if (!isset($_SESSION['login']) || (isset($_SESSION['login']) && $_SESSION['login'] !="admin1") || (isset($_SESSION['login']) && $_SESSION['login'] !="admin2") || (isset($_SESSION['login']) && $_SESSION['login'] !="admin3")) header('Location: http://admin.happyfoodforlife.com/users.php');
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
        $idUser = getUserIdByLogin($_SESSION['login']);
        $result = toWhomToAdd($database, $idUser, $_SESSION['login']);
        if($result == -1) echo '<p class="col-12 text-danger">Un problème est survenu ! Réessayez...</p>';
        else 
        {
            var_dump($result);
            if ($result[0]['nbGene1'] < 3) {
                $user = getUserById($database, $result['idUser'])?>
                <p class="col-12 text-success">
                    Après analyse optimisée de la généalogie, il serait optimable d'ajouter le filleul au parrain suivant : <br>
                    Nom du parrain : <?=$user['lastName']?> <br>
                    Prénom du parrain : <?=$user['firstName']?> <br>
                    <a class="col-2 m-3 btn btn-primary" href="godson_add_form.php?option=<?=$user['idUser']?>">Procédez à l'ajout</a>
                </p>
            <?php } elseif (condition) {
                # code...
            }
        }
      ?>
      </div>
    </section>
  </body>
</html>
