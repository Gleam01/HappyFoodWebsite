<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
  <body>
    <header id="default" class="row bg-light">
      <h1 class="col-sm-4"> <span>Happy</span>FOOD </h1>
      <h1 class="col-sm-8 text-right">
        BACK - END <span>PANEL</span>
      </h1>
    </header>

    <section id="content" class="row">
      <div class="w-50 mx-auto">
        <?php if (isset($_GET['status'])){
          if($_GET['status'] == 0) { ?>
            <div class="col-12 text-center alert alert-dimissable alert-danger">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              Identifiant ou mot de passe invalide
            </div>
          <?php } elseif ($_GET['status'] == -1) { ?>
            <div class="col-12 text-center alert alert-dimissable alert-danger">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              Mot de passe d'accès à la génération des codes invalide
            </div>
          <?php } elseif ($_GET['status'] == -2) { ?>
            <div class="col-12 text-center alert alert-dimissable alert-danger">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              Vous n'avez pas le grade pour accéder à la génération des codes
            </div>
          <?php  }
        }?>

        <div class="card">
          <div class="card-header bg-success">
            <h2 class="card-title text-center text-light">AUTHENTIFICATION</h2>
          </div>
          <div class="card-body">
            <form action="identifiers_verification.php" method="post">
              <div class="form-group">
                <label for="login" class="col-12 text-success text-center">Nom d'utilisateur</label>
                <input type="text" name="login" id="login" class="form-control" required>
              </div>
              <div class="form-group">
                <label for="password" class="col-12 text-success text-center">Mot de passe</label>
                <input type="password" name="password" id="password" class="form-control" required>
              </div>
              <div class="row">
                <a href="password-recovery/" class="col-12 text-right text-warning">Mot de passe oublié ?</a>
              </div>
              <div class="form-group">
                <button type="submit" class="mx-auto col-sm-4 btn btn-block text-light" name="submit" style="background-color: #1BBD36">
                  Se connecter
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
