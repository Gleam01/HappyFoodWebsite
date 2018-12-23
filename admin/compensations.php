<?php
  session_start();
  if (!isset($_SESSION['login'])) header('Location: http://admin.happyfoodforlife.com/');
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
          require_once('connect_db.php');
          $per_page = 15;
          if(isset($_GET['page']) & !empty($_GET['page'])) $current_page = (int) $_GET['page'];
          else $current_page = 1;

          $count_query = $database->query('SELECT COUNT(*) AS total_inputs FROM parrain_has_step');
          $data = $count_query->fetch();
          $total_inputs = $data['total_inputs'];

          $start = $per_page * ($current_page - 1);

          $end_page = ceil($total_inputs / $per_page);
          $start_page = 1;
          $next_page = $current_page + 1;
          $previous_page = $current_page - 1;
          $get_query = $database->query("SELECT Parrain_idParrain, Parrain_User_idUser, Step_idStep, giftTaken, DATE_FORMAT(date_taken, '%d/%m/%Y à %Hh%imin%ss') AS date_taken FROM parrain_has_step LIMIT $per_page OFFSET $start");
        ?>
        <h2>Inventaire des retraits de gains</h2>
        <?php
          if (isset($_GET['lastName'], $_GET['firstName'], $_GET['step'])) { ?>
            <div class="col-12 text-center alert alert-dimissable alert-success">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              Vous venez de spécifier que l'utilisateur <?= $_GET['lastName'].' '.$_GET['firstName']?> vient de retirer ses gains de l'étape <?= $_GET['step']-1 ?>.
            </div>
          <?php } elseif (isset($_GET['error'])) { ?>
                <div class="col-12 text-center alert alert-dimissable alert-danger">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  La mise à jour a échoué... Veuillez réessayer svp !
                </div>
            <?php } ?>
        <div class="col-12 table-responsive-md">
          <table class="table table-striped table-bordered table-responsive">
            <thead>
              <tr>
                <th>#</th>
                <th>Prénom</th>
                <th>Nom</th>
  				      <th>Etape</th>
                <th>Action</th>
                <th>En savoir plus</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = $start; while($row = $get_query->fetch()){
                $i++;
                $user = getUserById($database, $row['Parrain_User_idUser']);
                if(!$user) continue;
              ?>
              <tr>
                <td><?= $i > 9 ? $i : '0'.$i ?></td>
                <td><?= $user['firstName']  == NULL ? "Non défini" : $user['firstName'] ?></td>
                <td><?= $user['lastName'] == NULL ? "Non défini" : $user['lastName'] ?></td>
                <td><?= $row['Step_idStep'] == NULL ? "Non défini" : ($row['Step_idStep'] - 1) ?></td>
                <td style="word-wrap: wrap">
                  <?php
                    if ($row['giftTaken'] == 0) { ?>
                      <p>Gains non retirés</p>
                      <form action="retrait_treatement.php" method="post">
                        <input type="hidden" name="parrainId" value="<?= $row['Parrain_User_idUser'] ?>">
                        <input type="hidden" name="stepId" value="<?= $row['Step_idStep'] ?>">
                        <button type="submit">Changer</button>
                      </form>
                    <?php }
                    elseif ($row['giftTaken'] == 1) { ?>
                      <p>Gains retirés</p>
                      <p>Date de retrait : <?= $row['date_taken'] ?></p>
                    <?php }
                  ?>
                </td>
                <td>
                  <a href="details.php?id=<?= $user['idUser'] ?>" class="btn btn-block btn-success">
                    Plus sur l'utilisateur
                    <span class="fa fa-plus" aria-hidden="true"></span>
                  </a>
                </td>
              </tr>
  		        <?php } ?>
            </tbody>
          </table>
        </div>
        <br><br>
        <nav class="w-25 mx-auto" aria-label="Page navigation">
          <ul class="pagination">
            <?php if($current_page != $start_page){ ?>
              <li class="page-item">
                <a class="page-link" href="?page=<?= $start_page ?>" tabindex="-1" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                  <span class="sr-only">First</span>
                </a>
              </li>
            <?php } ?>
            <?php if($current_page >= 2){ ?>
              <li class="page-item">
                <a class="page-link" href="?page=<?= $previous_page ?>"><?= $previous_page ?></a>
              </li>
            <?php } ?>
            <li class="page-item active">
              <a class="page-link" href="?page=<?= $current_page ?>"><?= $current_page ?></a>
            </li>
            <?php if($current_page != $end_page){ ?>
              <li class="page-item">
                <a class="page-link" href="?page=<?= $next_page ?>"><?= $next_page ?></a>
              </li>
              <li class="page-item">
                <a class="page-link" href="?page=<?= $end_page ?>" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                  <span class="sr-only">Last</span>
                </a>
              </li>
            <?php } ?>
          </ul>
        </nav>
      </div>
    </section>
  </body>
</html>
