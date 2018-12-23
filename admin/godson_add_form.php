<?php
  session_start();
//  if (!isset($_SESSION['login']) || (isset($_SESSION['login']) && $_SESSION['login'] !="admin1") || (isset($_SESSION['login']) && $_SESSION['login'] !="admin2") || (isset($_SESSION['login']) && $_SESSION['login'] !="admin3")) header('Location: http://admin.happyfoodforlife.com/users.php');
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
            <h2 class="card-title text-light text-center">Ajout du filleul</h2>
          </div>
          <div class="card-body">
            <form action="godson_add_treatment.php" method="post" class="text-center text-success">
              <div class="form-group">
                <label for="code">Code de validation</label>
                <input type="text" name="code" id="code" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="lastName">Nom du filleul</label>
                <input type="text" name="lastName" id="lastName" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="firstName">Prénom du filleul</label>
                <input type="text" name="firstName" id="firstName" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="login">Nom d'utilisateur du filleul</label>
                <input type="text" name="login" id="login" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="password">Mot de passe du filleul</label>
                <input type="password" name="password" id="password" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="cpassword">Confirmer mot de passe du filleul : </label>
                <input type="password" name="cpassword" id="cpassword" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="phone">Numéro de téléphone du filleul</label>
                <input type="tel" name="phone" id="phone" class="form-control" required>
              </div>
              <div class="form-group">
                <input type="hidden" name="parrain_user_id" value="<?= $_GET['option']?>" class="form-control" required>
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
