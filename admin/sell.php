<?php
  require_once 'connect_db.php';
  if (isset($_POST['code_id'])) {
    $_POST['code_id'] = strip_tags($_POST['code_id']);
    $req = $database->prepare("
      UPDATE `codesvalidation`
      SET `selt` = '1'
      WHERE `codesvalidation`.`idCodesValidation` = ?");
    $upated = $req->execute(array($_POST['code_id']));
    if ($upated>0) {
      $count_query = $database->query('SELECT COUNT(*) AS total_inputs FROM codesvalidation WHERE selt=0');
      $data = $count_query->fetch();
      echo $data['total_inputs'];
    }
    else {
        echo 0;
      }
    }
    else {
      echo 0;
    }
?>
