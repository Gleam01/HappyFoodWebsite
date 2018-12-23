<?php
  session_start();
  if (!isset($_SESSION['login'], $_SESSION['role']) || $_SESSION['role'] != 1 ) {
    $_SESSION = array();
    session_destroy();
    header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/index.php?status=-2');
  }
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
  <body>
    <?php include_once 'header.php'; ?>

    <section id="content" class="row">
      <div class="w-50 mx-auto">
        <?php if (isset($_GET['status']) && $_GET['status'] == 0) { ?>
          <div class="col-12 text-center alert alert-dimissable alert-danger">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            Valeur non entrée
          </div>
        <?php } ?>

        <div class="card">
          <div class="card-header bg-success">
            <h2 class="card-title text-center text-light">VERIFICATION SUPER ADMIN</h2>
          </div>
          <div class="card-body">
            <form action="validate-post.php" method="post">
              <div class="form-group">
                <label for="password" class="col-12 text-success text-center">Entrez votre mot de passe</label>
                <input type="password" name="password" id="password" class="form-control" required>
              </div>
              <div class="form-group">
                <button type="submit" class="mx-auto col-sm-4 btn btn-block text-light" name="submit" style="background-color: #1BBD36">
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
