<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-end">
 <!-- Brand -->
 <a class="navbar-brand" href="#"><span>HAPPY</span>FOOD</a>

 <!-- Toggler/collapsibe Button -->
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu_container">
   <span class="navbar-toggler-icon"></span>
 </button>

 <!-- Navbar links -->
 <div class="collapse navbar-collapse" id="menu_container">
   <ul class="navbar-nav">
     <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="stats" data-toggle="dropdown">
         Statistiques utilisateurs
       </a>
       <div class="dropdown-menu">
         <a class="dropdown-item" href="users.php">Liste des utilisateurs</a>
         <a class="dropdown-item" href="godfathers.php">Liste des parrains</a>
         <a class="dropdown-item" href="godsons.php">Liste des filleuls</a>
         <a class="dropdown-item" href="godson_add.php">Ajouter un filleul</a>
       </div>
     </li>
     <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="stats" data-toggle="dropdown">
         Statistiques de Niveau
       </a>
       <div class="dropdown-menu">
         <a class="dropdown-item" href="step/0.php">Niveau 0</a>
         <a class="dropdown-item" href="step/1.php">Niveau 1</a>
         <a class="dropdown-item" href="step/2.php">Niveau 2</a>
         <a class="dropdown-item" href="step/3.php">Niveau 3</a>
       </div>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="compensations.php">Gestion des compensations</a>
     </li>
     <?php if ( $_SESSION['role'] == 1) { ?>
     <li class="nav-item">
       <a class="nav-link" href="validate.php">Génération de codes</a>
     </li>
     <?php } ?>
     <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="stats" data-toggle="dropdown">
         <?= $_SESSION['login'] ?>
       </a>
       <div class="dropdown-menu">
         <a class="dropdown-item">
           <?php
            switch ($_SESSION['role']) {
              case 0:
                echo "Administrateur";
              break;
              case 1:
                echo "Super Administrateur";
              break;
            }
           ?>
         </a>
         <?php if ( $_SESSION['role'] == 1) { ?>
           <a class="dropdown-item" href="add/">Ajout d'admin</a>
        <?php } ?>
         <a class="dropdown-item" href="logout.php">Déconnexion</a>
       </div>
     </li>
   </ul>
 </div>
</nav>
