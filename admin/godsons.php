<?php
  session_start();
  if (!isset($_SESSION['login'])) header('Location: http://localhost/HappyFoodWebsite/admin/');
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

          $count_query = $database->query('SELECT COUNT(*) AS total_inputs FROM filleuls');
          $data = $count_query->fetch();
          $total_inputs = $data['total_inputs'];

          $start = $per_page * ($current_page - 1);

          $end_page = ceil($total_inputs / $per_page);
          $start_page = 1;
          $next_page = $current_page + 1;
          $previous_page = $current_page - 1;

          $get_query = $database->query("SELECT * FROM filleuls LIMIT $per_page OFFSET $start");
        ?>
        <h2>Liste des filleuls</h2>
        <h3>Nombre total : <?= $total_inputs ?></h3>
        <div class="col-12 table-responsive-md">
          <table class="table table-striped table-bordered table-responsive">
            <thead>
              <tr>
                <th>#</th>
  				      <th>Nom</th>
                <th>Prénom</th>
                <th>Parrain</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = $start; while($row = $get_query->fetch()){
                $i++;
                $godson = getUserById($database, $row['User_idUser']);
                $godfather = getUserById($database, $row['Parrain_User_idUser']);
                if(!$godson AND !$godfather) continue;
              ?>
              <tr>
                <td><?= $i > 9 ? $i : '0'.$i ?></th>
                <td><?= $godson['lastName'] == NULL ? "Non défini" : $godson['lastName'] ?></td>
                <td><?= $godson['firstName']  == NULL ? "Non défini" : $godson['firstName'] ?></td>
                <td>
                  <a href="details.php?id=<?= $godfather['idUser'] ?>">
                    <?= $godson['firstName']  == NULL ? "Non défini" : $godson['firstName'] ?> &nbsp;
                    <?= $godson['lastName'] == NULL ? "Non défini" : $godson['lastName'] ?>
                  </a>
                </td>
                <td>
                  <a href="details.php?id=<?= $godson['idUser'] ?>" class="btn btn-block btn-success">
                    Plus
                    <span class="fa fa-plus" aria-hidden="true"></span>
                  </a>
                </td>
              </tr>
  		        <?php } ?>
            </tbody>
          </table>
        </div>
        <br><br>
        <?php if($total_inputs > $per_page){ ?>
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
        <?php } ?>
      </div>
    </section>
  </body>
</html>
