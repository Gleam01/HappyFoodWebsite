<?php
  session_start();
  if (!isset($_SESSION['login'])) header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/');
  if ($_SESSION['role'] != 1) header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/users.php');
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
  <body>
    <?php include_once 'header.php'; ?>

    <section class="row">
      <div class="mx-auto w-75">
        <form class="form-inline" method="post">
           <label for="nombre">Nombre de codes à générer : </label> &nbsp;&nbsp;
           <input type="number" min="1" name="nombre" class="form-control" id="nombre">&nbsp;&nbsp;
           <button type="submit" class="btn btn-success submit">Lancer la Génération</button>
        </form>
      </div>
      <div class="col-sm-12 text-center" style="margin-top: 15px">
        <a href="javascript:window.location.reload()" class="btn btn-info">Recharger la page</a>
      </div>
      <div class="col-sm-12 response text-center" style="margin-top: 15px; display:none"></div>
    </section>

    <section class="row">
      <div class="mx-auto w-50">
        <?php
          require_once('connect_db.php');
          $per_page = 15;
          if(isset($_GET['page']) & !empty($_GET['page'])) $current_page = (int) $_GET['page'];
          else $current_page = 1;

          $count_query = $database->query('SELECT COUNT(*) AS total_inputs FROM codesvalidation WHERE selt=0');
          $data = $count_query->fetch();
          $total_inputs = $data['total_inputs'];

          $start = $per_page * ($current_page - 1);

          $end_page = ceil($total_inputs / $per_page);
          $start_page = 1;
          $next_page = $current_page + 1;
          $previous_page = $current_page - 1;

          $get_query = $database->query("SELECT * FROM codesvalidation WHERE selt=0 LIMIT $per_page OFFSET $start");
        ?>
        <h2>Codes générés</h2>
        <h3 class="list-head">Nombre total : <?= $total_inputs ?></h3>
        <ol>
        <?php $i = $start; while($data = $get_query->fetch()){ $i++; ?>
            <li class="row" style="margin-bottom: 10px;">
              <p class="col-md-1"><?= $i ?>. </p>
              <div  class="col-md-1 checkbox-container">
                <input type="checkbox" class="checkbox">
              </div>
              <h4 class="col-md-4 id"><?= $data['code']?></h4>
              <div class="col-md-4 id" style="display:none"><?=$data['idCodesValidation']?></div>
              <button class="btn btn-success col-md-2 sell_one_request">Vendre</button>
            </li>
          <?php } ?>
        </ol>
        <div class="row">
          <button class="btn btn-primary col-md-2" id="tout_cocher">Tout cocher</button>
          <span class="col-md-4"></span>
          <button class="btn btn-primary col-md-3" id="vendre_plusieurs">Vendre plusieurs</button>
        </div>
      </div>
        <br><br>
        <?php if($total_inputs > $per_page){ ?>
          <div class="col-12">
            <nav class=" w-25 mx-auto" aria-label="Page navigation">
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
        <?php } ?>
      </div>
    </section>

    <script>
      $(document).ready(function() {
        function fadeResponse(color, text) {
          $('.response').text(text);
          $('.response').css('color', color);
          $('.response').fadeIn(2000).fadeOut(5000);
        }

        $('.submit').click(function() {
          var dataString = 'nombre=' + $('#nombre').val();
          $.ajax({
            type: 'POST',
            url: 'http://localhost/Web_Projects/HappyFoodWebsite/admin/genere_code.php',
            data: dataString,
            success: function(data) {
              if (data == 0) {
                fadeResponse('red', 'Nombre invalide !!!');
              }
              else if (data == 1){
                $('#nombre').val('');
                fadeResponse('green', 'Codes générés avec succès !');
              }
            },
            error: function(erreur) {
              fadeResponse('red', 'La requête n\'a pas abouti. Veuillez réessayer svp !!!');
            }
          });
          return false;
        });

        $('#tout_cocher').click(function(){
          $('.checkbox').each(function() {
            $(this).attr('checked', 'true');
          });
        });

        $('.sell_one_request').click(function() {
          var dataString = 'code_id='+$(this).parent().children('div.id').text().trim();
          console.log(dataString);
          $.ajax({
            type: 'POST',
            url: 'http://localhost/Web_Projects/HappyFoodWebsite/admin/sell.php',
            data: dataString,
            success: function(data) {
              if (data == 0) {
                console.log("sell err1");
                fadeResponse('red', 'Erreur !!!');
              }
              else {
                console.log("sell succ1");
                fadeResponse('green', ' Code vendu ');
                $('.list-head').text('Nombre total : ' + data);
              }
            },
            error: function(erreur) {
              fadeResponse('red', 'Erreur !!!');
            }
          });
          $(this).parent().remove();
        });

        $('#vendre_plusieurs').click(function(){
          $('input:checked').each(function() {
            var dataString = 'code_id='+$(this).parent().parent().children('div.id').text().trim();
            console.log(dataString);
            $.ajax({
              type: 'POST',
              url: 'http://localhost/Web_Projects/HappyFoodWebsite/admin/sell.php',
              data: dataString,
              success: function(data) {
                if (data == 0) {
                  console.log("sell errr2");
                  fadeResponse('red', 'Erreur !!!');
                } else {
                  $('.list-head').text('Nombre total : ' + data);
                }
              },
              error: function(erreur) {
                fadeResponse('red', 'Erreur !!!');
              }
            });
            $(this).parent().parent().remove();
          });
          fadeResponse('green', 'Codes vendus !');
        });
      });
    </script>

  </body>
</html>
