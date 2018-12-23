<?php
  require_once 'connect_db.php';
  if (isset($_POST['parrainId'], $_POST['stepId'])) {
    $_POST['parrainId'] = strip_tags($_POST['parrainId']);
    $_POST['stepId'] = strip_tags($_POST['stepId']);
    $req = $database->prepare("
      UPDATE parrain_has_step
      SET giftTaken = 1, date_taken = NOW()
      WHERE Parrain_idParrain = ?
      AND Step_idStep = ?");
    $upated = $req->execute(array($_POST['parrainId'], $_POST['stepId']));
    if ($upated>0) {
      $user = getUserById($database, $_POST['parrainId']);
      header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/compensations.php?lastName='.$user['lastName'].'&firstName='.$user['lastName'].'&step='.$_POST['stepId']);
    }
    else {
      header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/compensations.php?error=0');
    }
  }
  else {
      header('Location: http://localhost/Web_Projects/HappyFoodWebsite/admin/compensations.php?error=0');
  }
?>
