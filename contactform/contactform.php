<?php
  if (!empty($_POST['lastName']) && !empty($_POST['firstName']) && !empty($_POST['phone']) && !empty($_POST['message'])) {
    $_POST['lastName'] = strip_tags($_POST['lastName']);
    $_POST['firstName'] = strip_tags($_POST['firstName']);
    $_POST['phone'] = strip_tags($_POST['phone']);
    $_POST['message'] = strip_tags($_POST['message']);

    $header="MIME-Version: 1.0\r\n";
    $header.='From:"HAPPY-FOOD Website'."\n";
    $header.='Content-Type:text/html; charset="utf-8"'."\n";
    $header.='Content-Transfer-Encoding: 8bit';
    $message = '
    <html>
    <head>
      <title>Formulaire de contact</title>
      <meta charset="utf-8"/>
      <link rel="stylesheet" href="css/bootstrap.min.css"
    </head>
    <body>
      <div class="container">
        <div class="row">
          <p class="text-center">
            Un utilisateur vient de soumettre le formulaire de contact !
            Voici les informations entrées par l\'utilisateur : <br>
            Nom : '.strip_tags($_POST['lastName']).'<br><br>
            Prénom : '.strip_tags($_POST['firstName']).'<br><br>
            Numéro de téléphone : '.strip_tags($_POST['phone']).'<br><br>
            Message : '.strip_tags($_POST['message']).'<br>
          </p>
        </div>
      </div>
    </body>
    </html>';
    mail('contact@happyfoodforlife.net', "Formulaire de contact", $message, $header);
    header('Location: ../contact.php?ok=1');
  }
  else {
    header('Location: ../contact.php?ok=0');
  }
