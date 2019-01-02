<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HappyFood - Contact</title>
  <link rel="shortcut icon" href="img/fav.png" type="image/x-icon">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/nivo-slider/css/nivo-slider.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.carousel.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.transitions.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">

  <link rel="stylesheet" href="device-mockups/device-mockups.min.css">



  <!-- Nivo Slider Theme -->
  <link href="css/nivo-slider-theme.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style1.css" rel="stylesheet">

  <!-- Input tel Stylesheet File -->
  <link href="css/phone.css" rel="stylesheet">

  <!-- Responsive Stylesheet File -->
  <link href="css/responsive.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="css/intlTelInput.css">



  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/animate.css">
  <link href="css/prettyPhoto.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet" />

  <style>
    #lastName,#firstName,#phone,#message {
      border: 2px solid #1BFD36;
      border-radius: 5px;
    }
  </style>

  <!-- =======================================================
    Theme Name: Company
    Theme URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>


<body>
  <header>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
            <div class="navbar-brand">
              <a href="index.html"><h1><span>Happy</span>Food</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="index.html">Accueil</a></li>
                <li role="presentation"><a href="about.html">A propos</a></li>
                <li role="presentation"><a href="services.html#app">Notre application</a></li>
                <li role="presentation"><a href="portfolio.html">Plan de compensation</a></li>
                <li role="presentation"><a href="contacts.php" class="active">Nous contacter</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </header>

  <div id="breadcrumb">
    <div class="container">
      <div class="breadcrumb">
        <li><a href="index.html">Accueil</a></li>
        <li>Nous contacter</li>
      </div>
    </div>
  </div>

  <marquee><h3>Pour toutes vos inquiétudes, veuillez remplir le formulaire de contact ci-dessous et nous le soumettre !</h3></marquee>

  <br><br>

  <section id="contact">
    <div class="container">
      <div class="row">
        <?php
          if (isset($_GET['ok'])) {
            if ($_GET['ok']=="1")
              echo '<h4 style="color: #1BBD36; text-align: center">Votre message a été envoyé. Merci!</h4><br>';
            elseif ($_GET['ok']=="0")
              echo '<h4 style="color: red; text-align: center">Veuillez bien renseigner tous les champs svp !</h4><br>';
          }
        ?>
        <div class="col-md-7">
          <div class="form" id="contactForm">
            <form action="contactform/contactform.php" method="post" role="form">
              <div class="form-group">
                <input name="lastName" type="text" class="form-control" id="lastName" placeholder="Votre nom">
              </div>
              <div class="form-group">
                <input type="text" name="firstName" class="form-control" id="firstName" placeholder="Votre prénom">
              </div>
              <div class="form-group">
                <input type="tel" name="phone" class="intl-tel-input form-control" id="phone">
              </div>
              <div class="form-group">
                <textarea id="message" name="message" class="form-control" placeholder="Votre message" rows="7"></textarea>
              </div>
              <div class="text-center"><button id="submit" type="submit" class="btn" style="background-color: #1BBD36;">Envoyer le message</button> <br> </div>
            </form>
          </div>
        </div>
        <div class="col-md-5">
          <img style=""src="images/happyfoodnez.jpg" alt="Rejoignez-nous dans le programme HAPPY-FOOD">
        </div>
      </div>
    </div>
  </section> <!-- #contact -->
  <br><br>

  <footer>
    <div class="footer">
      <div class="container">
        <div class="social-icon">
          <div class="col-md-4">
            <ul class="social-network">
              <li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-4 col-md-offset-4">
          <div class="copyright">
            &copy; HappyFood. All Rights Reserved.
            <div class="credits">
              <!--
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Company
              -->

          </div>
        </div>
      </div>
      <div class="pull-right">
        <a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
      </div>
    </div>
  </footer>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.prettyPhoto.js"></script>
  <script src="js/jquery.isotope.min.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/functions.js"></script>

  <!-- input tel script -->
  <script src="js/intlTelInput.js"></script>
  <script>
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
      // formatOnDisplay: false,
      geoIpLookup: function(callback) {
        $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
          var countryCode = (resp && resp.country) ? resp.country : "";
          callback(countryCode);
        });
      },
      // hiddenInput: "full_number",
      initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      // nationalMode: false,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      separateDialCode: true,
      utilsScript: "js/utils.js",
    });
  </script>
</body>

</html>
