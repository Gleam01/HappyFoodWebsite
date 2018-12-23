<?php
  if (isset($_POST['nombre'])) {
    $nombre = (int)strip_tags($_POST['nombre']);
    if ($nombre <= 0) echo 0;

    include_once 'manage_code.php';
    creation_mots_de_passe($database, 10, $nombre);
    $data = get_code($database, $nombre);
    echo 1;
  }
  else {
    echo 0;
  }
?>
