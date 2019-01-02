<?php
  session_start();
  if (!isset($_SESSION['login']) && $_SESSION['login'] !== "SmartDev" || !isset($_SESSION['login']) && $_SESSION['role'] != 1) header('Location: http://localhost/HappyFoodWebsite/admin/');
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once '../head.php'; ?>
  </head>
  <body>
    <?php include_once 'header.php'; ?>
    <section id="content" class="row">
      <div class="w-50 mx-auto">
        <?php
          if (isset($_GET['status'])) {
            if ($_GET['status'] == 0) { ?>
              <div class="col-12 text-center alert alert-dimissable alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                Données erronées !!! Réessayez !
              </div>
        <?php }
            elseif ($_GET['status'] == 1) {?>
              <div class="col-12 text-center alert alert-dimissable alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                Ajout effectué avec succès
              </div>
        <?php }
          } ?>

        <div class="card">
          <div class="card-header bg-success">
            <h2 class="card-title text-light text-center">Ajout d'un administrateur</h2>
          </div>
          <div class="card-body">
            <form action="add_admin_treatment.php" method="post" class="text-center text-success">
              <div class="form-group">
                <label for="lastName">Nom</label>
                <input type="text" name="lastName" id="lastName" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="firstName">Prénom</label>
                <input type="text" name="firstName" id="firstName" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="email">Adresse E-mail</label>
                <input type="email" name="email" id="email" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="login">Login</label>
                <input type="text" name="login" id="login" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" name="password" id="password" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="cpassword">Confirmer mot de passe : </label>
                <input type="password" name="cpassword" id="cpassword" class="form-control" required>
              </div>
              <div class="form-group">
                <button type="submit" class="mx-auto text-light col-sm-4 btn btn-block btn-success">
                  Valider
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
