<?php
header("Access-Control-Allow-Origin: *");
   // Définition des paramètres de la base de donnée
$hn      = 'localhost';
   $un      = 'root';
   $pwd     = '';
   $db      = 'happyfooddb';
   $cs      = 'utf8';

   // paramètres PDO
   $dsn 	= "mysql:host=" . $hn . ";port=3306;dbname=" . $db . ";charset=" . $cs;
   $opt 	= array(
                        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
                        PDO::ATTR_EMULATE_PREPARES   => false,
                       );
   // Création de l'instance PDO (connexion à la base de donnée)
   $pdo 	= new PDO($dsn, $un, $pwd, $opt);


   // Récupération des données envoyées par l'application
   $json    =  file_get_contents('php://input');
   $obj     =  json_decode($json);
   $key     =  strip_tags($obj->key); 




   // Determine which mode is being requested
   switch($key)//suivant la clée fournie par l'application on effectue une action
   {


	  // Add a new record to the technologies table

	    case "verif_code":
            $code = filter_var($obj->code, FILTER_SANITIZE_NUMBER_INT, FILTER_FLAG_ENCODE_LOW);
            try
            {
                $requete_code = $pdo->prepare("SELECT id FROM code WHERE codeActivation = ?");
                $requete_code->execute(array($code)); 
                $nbValid = $requete_code->rowCount();
                $idCode = $requete_code->fetch();
                if($nbValid == 0)//on a pas trouvé de code correspondant
                {
                    $data['donnee'] = false;
                    $data['message'] = "il n'y a pas de code compatibl";
                }
                else
                {
                    $data['donnee'] = $idCode;
                    $data['message'] = "success";
                }
                echo json_encode($data);
            }
            catch(Exception $e)
            {
                echo 'Exception reçue : ',  $e->getMessage(), "\n";
            }

            break;

        case "addFilleul":
            $id_parrain = filter_var($obj->userId, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $login = filter_var($obj->pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $passwordd = filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $lastName = filter_var($obj->nom, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $firstName = filter_var($obj->prenom, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $phone = filter_var($obj->num, FILTER_SANITIZE_NUMBER_INT, FILTER_FLAG_ENCODE_LOW);
            $sex= 'M';
            $code =$obj->code;
        
            $password=password_hash($passwordd,PASSWORD_BCRYPT,['cost'=>10]);

            $pseudo_exist= verif_pseudo($pdo, $login);

            if($pseudo_exist != 0)//il exite un pseudo du genre
            {
              $data['message']="Cet pseudo est déja utilisé!!";
              echo json_encode($data);
/*
              $b=addStep($pdo, 15, 0);
              $data['message']=$b;
              echo json_encode($data);
*/
            }
            else
            {
                  try {
                  $requete=$pdo->prepare("
                  INSERT INTO `user` (`login`, `password`, `lastName`, `firstName`, `phone`, `admin`, `newUser`)
                  VALUES (?,?,?,?,?,?,?);"
               );
                  $requete->execute(array( $login, $password, $lastName, $firstName, $phone, '0', '1'));

                  $id_new_filleul = $pdo->lastInsertId();
                  $data['message']="Success new filleul insert : ".$id_new_filleul;
                  //echo json_encode($data);
                   }
                   catch(PDOException $e)
                  {
                    $data=$e;
                    echo json_encode($data);

                  }
                  addParrain($id_parrain, $id_new_filleul, $code );
            }



      break;

      case "getIdFromLogin":
      $login = filter_var($obj->login, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
     $resultat= getIdFromLogin($pdo, $login);

     if($resultat==(-1))
     {
      $data['message']="error";
      $data['info']="pas de parrain avce ce login";
      $data['data']=(-1);
      echo json_encode($data);

     }
     else
     {
      $data['message']="success";
      $data['data']=($resultat);

      echo json_encode($data);
     }

      break;

      case "login":
      $pseudo   = filter_var($obj->pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
      $password  = filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

        $data = getUserInfo($pdo, $pseudo, $password);
        echo json_encode($data);

        break;

      case 'getStepNum':
        $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        
        //$data = getStepNumForParrain($pdo, $id);
        $data['message']="";
        $data['data']="";
        $num = getParrainActualStep($pdo, $id);

        if($num ==(-2))
        {
          //le neggro a tout fini
          $data['data']=3;
          $data['message']="success";
        }
        else if($num !=(-1))
        {
          $data['data']=$num;
          $data['message']="success";
        }
        else
        {
          $data['message']="error";
        }
        
        echo json_encode($data);


      break;

      case 'changeInfo':
        $adress  = filter_var($obj->adress, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $birthday = filter_var($obj->birthday, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $firstName = filter_var($obj->firstName, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $idUser = filter_var($obj->idUser, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $job = filter_var($obj->job, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $lastName = filter_var($obj->lastName, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $login = filter_var($obj->login, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $newUser = filter_var($obj->newUser, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $password = filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $phone = filter_var($obj->phone, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $sex = filter_var($obj->sex, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $photo = filter_var($obj->photo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $mail = filter_var($obj->mail, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW); 
        $pays = filter_var($obj->pays, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW); 

        $data = changeInfo($pdo, $adress,$birthday,$firstName,$idUser,$job,$lastName,$login,$newUser,$password,$phone,$sex,$photo,$mail,$pays);

        echo json_encode($data);



        break;

  case 'getNbGene':
    $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
    $data = getNbGene($pdo, $id);
    echo json_encode($data);
    break;

  case 'getNbGene2':
    $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
    $data['message']="success";

    $data['data'] = getNbGene2($pdo, $id, "user");
    echo json_encode($data);          
    break;

  case 'getNbGeneAll':
    $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
    $num   = filter_var($obj->num, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

    //$data['message']="success";

    $data = getNbGeneAll($pdo, $id, $num);

    $id_filleulg1 = $data['data']['gene1']['id'];
    $id_filleulg2 = $data['data']['gene2']['id'];
    $id_filleulg3 = $data['data']['gene3']['id'];
    // print_r($id_filleulg1);
    // print_r($id_filleulg2);
    // print_r($id_filleulg3);


    foreach ($id_filleulg1 as $key => $value) {
      $pseudo_filleulg1[]=getPseudoOf($pdo, $value)['data'];
    }
     foreach ($id_filleulg2 as $key => $value) {
      foreach ($value as $key => $value2) {
        $pseudo_filleulg2[]=getPseudoOf($pdo, $value2)['data'];
      }
    }
     foreach ($id_filleulg3 as $key => $value) {
      foreach ($value as $key => $value2) {
        $pseudo_filleulg3[]=getPseudoOf($pdo, $value2)['data'];
      }
    }
    // print_r($pseudo_filleulg1);
    // print_r($pseudo_filleulg2);
    // print_r($pseudo_filleulg3);

     $data['data']['gene1']['pseudo']=$pseudo_filleulg1;
     $data['data']['gene2']['pseudo']=$pseudo_filleulg2;
     $data['data']['gene3']['pseudo']=$pseudo_filleulg3;


    echo json_encode($data);          
    break;

    case 'getFilleulOf':
    $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

    $data1=getFilleulsOf($pdo, $id);
    $pseudo_filleul_gene1=$data1['data'];
    if($data1['message']=="success")
    {
      $idFilleulGene1=$data1['data_id'];
      foreach ($idFilleulGene1 as $key => $value) {
        $d=getFilleulsOf($pdo, $value);
        $data2[]=$d;
        $pseudo_filleul_gene2[]=$d['data'];
      }

    }
    $gene['message']="success";
    $gene['gene1']=$pseudo_filleul_gene1;
    $gene['gene2']=$pseudo_filleul_gene2;


    echo json_encode($gene);          
    break;

  case 'verifEntry':

        $login = filter_var($obj->login, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

        $phone = filter_var($obj->phone, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
            $id   = filter_var($obj->id, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);


    $nb = verifEntry($pdo, $login, $id);
    echo json_encode($nb);          
    break;

    case 'verif_mdp_recup_info_':
            $recup_pseudo   = filter_var($obj->recup_pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

        $recup_number = filter_var($obj->recup_number);

        

        $recup_profession = filter_var($obj->recup_profession, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

        $recup_Date = filter_var($obj->recup_date, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);



    $data = verif_mdp_recup_info_($pdo,$recup_pseudo, $recup_number, $recup_profession, $recup_Date);
    echo json_encode($data);          
    break;

case 'verif_mdp_and_modif':
        $login   = filter_var($obj->login, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
        $old_password = filter_var($obj->old_password);
        $new_password = filter_var($obj->new_password);
        $userpassword = filter_var($obj->userpassword);


    $data = verif_mdp_and_modif($pdo,$login, $userpassword,$old_password,$new_password);
    echo json_encode($data);          
    break;

    case 'change_mdp':
            $recup_pseudo   = filter_var($obj->recup_pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

        $new_mdp = filter_var($obj->new_mdp);

    $data = change_mdp($pdo,$recup_pseudo, $new_mdp);
    echo json_encode($data);          
    break;

    case 'addFilleuTest':

          $idnp = filter_var($obj->idnp);
          $id_nfilleul= filter_var($obj->id_nfilleul);
          $id_user = filter_var($obj->id_user);

      $data = addFilleul($idnp, $id_nfilleul, $id_user);

      echo json_encode($data);          
      break;


    

}

function verif_mdp_and_modif($pdo,$login,$userpassword,$old_password,$new_password)
{
  try {

      if(password_verify($old_password, $userpassword))
      {
        $data2=change_mdp($pdo,$login,$new_password);
        return $data2;
      }

      else
      {
         $data['data']="pas meme pass";
         $data['message']="error";
          return $data;

      }
    }
     catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
}

function change_mdp($pdo,$recup_pseudo, $new_mdp)
{

   
  try {

        $newPass = password_hash($new_mdp,PASSWORD_BCRYPT,['cost'=>10]);

      $requete=$pdo->prepare("
        UPDATE `user` SET `password` = ? WHERE `user`.`login` = ?;

        ");
      $nb=$requete->execute(array($newPass, $recup_pseudo));
      $data['data']="rien";
      $data['message']="rien";
      if($nb==false)
      {
        $data['data']="";
        $data['message']="error";
      }
      else if ($nb==true) {
        $data['data']="";
        $data['message']="success";
      }
      return $data;
    }
     catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }

}


function verif_mdp_recup_info_($pdo,$recup_pseudo, $recup_number, $recup_profession, $recup_Date)
{
  try {

      $requete=$pdo->prepare("
        SELECT * FROM `user` WHERE login=? AND phone=? AND job=? AND birthday=?
        ");
      $requete->execute(array($recup_pseudo,$recup_number,$recup_profession, $recup_Date ));
      $data['data']="rien";
      $data['message']="rien";
      $nb=$requete->rowCount();
      if($nb==0)
      {
        $data['data']="";
        $data['message']="error";
      }
      else
      {
        $data['data']="";
        $data['message']="success";
      }
      return $data;
    }
     catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }

}
    function verif_pseudo($pdo, $login)
    {
      try {

      $requete=$pdo->prepare("SELECT * FROM `user` WHERE login=?");
      $requete->execute(array($login));
      $data['data']="rien";
      $data['message']="rien";
      $nb=$requete->rowCount();

      return $nb;
    }

       catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
    }

    

    function getIdFromLogin($pdo, $login)
    {
      try {

      $requete=$pdo->prepare("SELECT idUser FROM `user` WHERE login=?");
      $requete->execute(array($login));
      $data['data']="rien";
      $data['message']="rien";
      $nb=$requete->rowCount();

      if($nb>0)
      {
        $id = $requete->fetch();
        return ($id->idUser);
      }
      else
      {
        return (-1);
      }
    }

       catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
    }

    function getNbGeneAll($pdo, $id, $numStep)
    {
      try 
      {
          $nbg1_f1=array(0,0,0);
          $nbg1_f2=array(0,0,0);
          $nbg1_f3=array(0,0,0);
          $filleuls_id_gene1_in_user_return=array(-1,-1,-1);

          $filleuls_id_gene2_in_user_return=array(
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,);
          
          $filleuls_id_gene3_in_user_return=array(
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,
            $filleuls_id_gene1_in_user_return,

          );

          $nbGene1=0;
          $nbGene2=0;
          $nbGene3=0;
          $i=0;$j=0;

        $id_numStep=getStepIdFor($pdo, $numStep);
        $dataGene1 = getnbgene1ForStep($pdo, $id, $id_numStep);

          if($dataGene1['message']=="success")
          {
            //ici on recupere les filleuls de step numstep

            $nbGene1=$dataGene1['nbGene1'];
            $nbg1_f1=$dataGene1['nbg1_f'];

            $filleuls_id_gene1_in_user=$dataGene1['id'];
            $filleuls_id_gene1_in_user_return=$dataGene1['id'];

            //pour chaque filleul deniveau numStep () on cherche ces filleuls de niveau numStep ()

            foreach ($filleuls_id_gene1_in_user as $key => $id_filleul1) 
            {
              $dataGene2 = getnbgene1ForStep($pdo, $id_filleul1, $id_numStep);
              if($dataGene2['message']=="success")
              {
                //si ce filleul a des filleul de niveau 1
                $nbGene2=$nbGene2 + $dataGene2['nbGene1'];
                $nbg1_f2[$i]=$dataGene2['nbg1_f'];

                $filleuls_id_gene2_in_user=$dataGene2['id'];
                $filleuls_id_gene2_in_user_return[$i]=$dataGene2['id'];


                foreach ($filleuls_id_gene2_in_user as $key => $id_filleul2) 
                {
                  $dataGene3 = getnbgene1ForStep($pdo, $id_filleul2, $id_numStep);
                  if($dataGene3['message']=="success")
                  {
                    //si ce filleul a des filleul de niveau 1
                    $nbGene3=$nbGene3 + $dataGene3['nbGene1'];
                    $nbg1_f3[$j]=$dataGene3['nbg1_f'];
                    $filleuls_id_gene3_in_user_return[$j]=$dataGene3['id'];
                    $filleuls_id_gene3_in_user=$dataGene3['id'];
                  }
                  else
                  {
                    $nbg1_f3[$j]=array(0,0,0);
                    $filleuls_id_gene3_in_user_return[$j]=array(-1,-1,-1);
                  }
                  $j=$j+1;
                }
              }
              else
              {
                $nbg1_f2[$i]=array(0,0,0);
                $filleuls_id_gene2_in_user_return[$i]=array(-1,-1,-1);


              }
              $i=$i+1;

            }

            $data['gene1']['nbGene1']=$nbGene1;
            $data['gene1']['nbg1_f']=$nbg1_f1;
            $data['gene1']['id']=$filleuls_id_gene1_in_user_return;
            $data['gene2']['nbGene2']=$nbGene2;
            $data['gene2']['nbg1_f']=$nbg1_f2;
            $data['gene2']['id']=$filleuls_id_gene2_in_user_return;
            $data['gene3']['nbGene3']=$nbGene3;
            $data['gene3']['nbg1_f']=$nbg1_f3;
            $data['gene3']['id']=$filleuls_id_gene3_in_user_return;



            //$nbGene3=27;
            if(($nbGene3)==27)
            {                

              $num = getParrainActualStep($pdo, $id);
              //echo "je suis ici ".$num." ";
              //if($num == (-2)) 
              if($num==$numStep)
              {
                //ici c'est que le nbgene3 de ce pere est déja a 27. a priori il doit aller vers l'etape suivante. mais on vérifi si son étape actuelle n'est pas déja l'étape la si oui on fait 
                $return = mise_a_jour_step($pdo, $id, $numStep);
                 if($return['message']=="success")
                 {
                    $bigdata['info']="mise a jour du step vers step suivant ia".($numStep+1);
                 }
                 else if($return['message']=="success" && $return['code']==2)
                 {
                  $data['message']="error";
                  $data['code']=2;
                  return $data;

                 }
                 else
                 {
                  
                  return $return;

                 }
              }
              else
              {
                //ici cest a dire que le user a atteint un nbg3 de 27 mais le step en analyse n'est pas son step actuel. cela veut dire donc qu'il était déja passé à l'étape suivante
              }
            }
            $bigdata['message']="success";
            $bigdata['data']=$data;
            
            return $bigdata;

          }
          else
          {
            $data['message']="error";
            $data['info']="pas de filleul directe trouvé";
            $data['data']=(-1);
            return $data;//pas de filleul de niv du pere
          }

      }

      catch(PDOException $e)
      {
        $data=$e;
        echo json_encode($data);
      }
    }
    
    function getnbgene1ForStep($pdo, $id, $id_step)
    {
      try {

      $requete=$pdo->prepare("

        SELECT filleuls.User_idUser 
        FROM `filleuls` 
        WHERE Parrain_User_idUser = ? 
        ");
      $requete->execute(array($id));

      $data['message']="null";
      $nb=$requete->rowCount();
      if($nb==0)
      {

        $data['message']="error";//PAS DE FILLEUL DIRECTE TOUVÉ
        $data['data']=(-1);
        return $data;
      }
      else if($nb>0)
      {
        $filleuls=$requete->fetchAll();
        $nbGene1 = 0;
        //$nbg1_f[0]=0;
        $i=0;
        $j=0;
        //echo $filleuls;
        foreach ($filleuls as $key => $value) {
          
          //ici on met à jours le step de chaque filleul. c'est a dire que
          //même si il se sont pas connecté sur leur dash pour le faire on le fait auto ici

          getNbGene2($pdo, $value->User_idUser, "parrain");
          getNbGeneAll($pdo, $value->User_idUser, getNumForStepId($pdo, $id_step));

          $requete_fstep1= $pdo->prepare("
            SELECT parrain_has_step.Parrain_User_idUser 
            FROM parrain_has_step 
            INNER JOIN parrain 
              ON parrain_has_step.Parrain_User_idUser=parrain.User_idUser
            WHERE Parrain_User_idUser = ?
              AND parrain_has_step.Step_idStep=?
");
          $id_filleul_in_user = $value->User_idUser;
          $requete_fstep1->execute(array($id_filleul_in_user, $id_step));
          $nbresult = $requete_fstep1->rowCount();
          
          if($nbresult==0)
          {
              //pas de filleul de step1
            //echo "ici pour : ".$id_filleul_in_user."|   ";
            $nbg1_f[$i]=0;
            $data['id'][$j]=(-1);
          }
          else
          {

            $nbg1_f[$i]=1;
            $id_filleul_step1_in_user=$requete_fstep1->fetch();
            $id_filleul_step1_in_user=$id_filleul_step1_in_user->Parrain_User_idUser;

            $data['id'][$j]=$id_filleul_step1_in_user;

            //$data['data']=
          }
          $j=$j+1;
          $i=$i+1;
      }

      $nbGene1 = array_sum($nbg1_f);
      $data['nbGene1']=$nbGene1;
      $data['nbg1_f']=$nbg1_f;
      $data['message']="success";

      //echo "ANALYSE DE :".$id;
      //echo "   LES FILS RETENU : ";
     // echo json_encode($data['id']);

      return $data;
    }

      

      
    }

    catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
  }

    function getNbGene($pdo, $id)
    {
       try {

      //$nbgene1=getNbGene($pdo, $id);//a voir
      //$nbgene2=getNbGene2($pdo, $id);

        $requete_nbgene1= $pdo->prepare("
            SELECT parrain.nbGene1
            FROM parrain 
            WHERE parrain.User_idUser = ?
            ");

        $requete_nbgene1->execute(array($id));
        $nb = $requete_nbgene1->rowCount();
        if($nb>0)
        {
          $nbgene1 = $requete_nbgene1-> fetch();
          $nbgene1 = $nbgene1->nbGene1;
          $data['message']="success";
          $data['data']['nbGene1']=$nbgene1;
          return $data;

        }
        else
        {
           $data['message']="error";
           $data['data']=(-1);

           return $data;
        }
        

      }

       catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }

    }


    function getFilleulsOf($pdo, $idpere)
    {
      try
      {
        $requete_filleuls = $pdo->prepare("SELECT User_idUser FROM `filleuls` WHERE Parrain_User_idUser=?");
        $requete_filleuls->execute(array($idpere));

        $nb=$requete_filleuls->rowCount();

        if($nb>0)
        {
           $filleuls = $requete_filleuls-> fetchAll();

           // $pseudo_filleuls

            foreach ($filleuls as $key => $value) {
              $filleul = $value ->User_idUser;

              $data= getPseudoOf($pdo, $filleul);
              $idFilleuls[]=$filleul;
              if($data['message']=="success")
              {
                $pseudo_filleuls[] =$data['data'];
              }
            }

            $d['message']="success";
            $d['data']= $pseudo_filleuls;
            $d['data_id']=$idFilleuls;
          }
       else
       {
        $d['message']="error";
        $d['data']=array("");
       }

       return $d;
}
        catch(PDOException $e)
      {
         $data=$e;//problmeme ajour nouveau parrain
         echo json_encode($data);
      }

    }

    function getPseudoOf($pdo, $id)
    {
      try {

      $requete=$pdo->prepare("SELECT login FROM `user` WHERE idUser=?");
      $requete->execute(array($id));
      $data['data']="rien";
      $data['message']="rien";
      $nb=$requete->rowCount();

      if($nb>0)
      {
        $login = $requete->fetch();
        $data['message']="success";
        $data['data']=$login->login;
        return ($data);
      }
      else
      {
        $data['message']="error";
        $data['data']="";
        return ($data);
      }
    }

       catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
    }

    function getNbGene2($pdo, $idpere_in_user, $qui)
    {
      try
      {
        $requete_filleuls = $pdo->prepare("SELECT * FROM `filleuls` WHERE Parrain_User_idUser=?");
        $requete_filleuls->execute(array($idpere_in_user));

        $filleuls = $requete_filleuls-> fetchAll();

        


        $nbGene2 = 0;
        $nbg1_f['1']=0;
        $step_maj=false;
        $i=1;
        foreach ($filleuls as $key => $value) {

          $les_idfilleuls_User['gene1'][]=$value->User_idUser;

          $requete_nbgene2= $pdo->prepare("
            SELECT parrain.nbGene1
            FROM parrain 
            INNER JOIN filleuls 
              ON filleuls.User_idUser=parrain.User_idUser 
            WHERE filleuls.idFilleuls=?
");
          $id_filleul = $value->idFilleuls;
          $requete_nbgene2->execute(array($id_filleul));
          $nbresult = $requete_nbgene2->rowCount();
          if($nbresult==0)
          {
            //pas de resultat donc n'a certainement pas de fils
          }
          else
          {
            //cet filleul est bien un parrain
            $nbg = $requete_nbgene2->fetch();
            $nbg = $nbg->nbGene1;
            $nbg1_f['_'.$i.'']=$nbg;
            $nbGene2=$nbGene2 + $nbg;//on incremente le nbgene2 du grand pere
            if($nbGene2 == 9)//il a finit etape 0
            {
              //on fera une maj si le step actuel du user est 0 sinon c'est juste qu'il affiche
              $num = getParrainActualStep($pdo, $idpere_in_user);
              if($num == 0 )
              {
                 mise_a_jour_step($pdo, $idpere_in_user, $num);
                 if($qui=="user") $step_maj=true;
              }
              else
              {
                //ca veut dire que le user n'est plus a l'etape 0 et son nbGene2 est déja à 9 pour etape 0
              }
            }
          }
          $i++;
        }

       // print_r($les_idfilleuls_User);

              //return $nbGene2;
        return array($nbg1_f, $step_maj);

      }


      catch(PDOException $e)
      {
         $data=$e;//problmeme ajour nouveau parrain
         echo json_encode($data);
      }

    }


    function mise_a_jour_step($pdo, $idpere_in_user, $num)
    {
      //$num = getParrainActualStep($pdo, $idpere_in_user);
      $data['message']="";
      $data['data']="";
      if($num !=(-1))
      {
        $id_step = getStepIdFor($pdo, $num);
        setReadyUp($pdo,$idpere_in_user, $id_step);
        if(($num+1)<=3)
        {
          $result_adding = addStep2($pdo, $idpere_in_user, ($num+1));//on le met au step +1
          if($result_adding)
          {
            $data['message']="success";
            return $data;
            //echo json_encode($data);
          }
          else
          {
            $data['message']="error";
            $data['code']=1;
            $data['info']="erreur lors de l'ajout du step suivant";
            return $data;
          }
        }
        else
        {
          $data['message']="error";
          $data['code']=2;
          $data['info']="num step suivant dépasse 3. l'individu a donc finis toutes les matrices";
          return $data;
          
        }
      }
      else
      {
        //a priori jamain ici
        $data['message']="error";
        return $data;
      }
      
    }

    function setReadyUp($pdo,$idpere_in_user, $id_step )
    {



      try {

      $requete=$pdo->prepare("

        UPDATE `parrain_has_step` 
        SET `readyUp` = '1' 
        WHERE `parrain_has_step`.`Parrain_User_idUser` = ?
          AND `parrain_has_step`.`Step_idStep` = ?;

        ");
      $requete->execute(array($idpere_in_user, $id_step));

      return $requete;

      }

       catch(PDOException $e)
      {
        $data=$e;//problmeme maj ready up
        echo json_encode($data);
      }
    }

    function getParrainActualStep($pdo, $idpere)
    {
      try {

      $requete=$pdo->prepare("

        SELECT step.num
            FROM step 
            INNER JOIN parrain_has_step 
              ON step.idStep=parrain_has_step.Step_idStep 
            WHERE parrain_has_step.Parrain_User_idUser=?
            AND parrain_has_step.readyUp = ?;

        ");
      $requete->execute(array($idpere, 0));
      $nb = $requete->rowCount();
      if($nb == 0)//pas de reusltat
      {
        $is_f = getNbStep($pdo, $idpere);
        if($is_f==1)
        {
          //le neggro a fini
          return (-2);
        }
        else
        {
          //bah une vrai erreur
          return (-1);
        }
      }
      else
      {
        $num = $requete->fetch();
        $num = $num->num;
        return $num;

      }
     

      return $requete;

      }

       catch(PDOException $e)
      {
        $data=$e;//problmeme maj ready up
        echo json_encode($data);
      }
    }

    function getNbStep($pdo, $id)
    {
      try
      {
        

        $requete_step=$pdo->prepare("

        SELECT * 
        FROM `parrain_has_step` 
        WHERE `Parrain_User_idUser` = ? 
        AND `readyUp`= ?
        ");
        $requete_step->execute(array($id, 1));
        $nb = $requete_step->rowCount();
        if($nb == 4)//le neggro a fini tous les niveaux
        {

          return (1);
        }
        else
        {
          return (0);
        }

      }
      catch(PDOException $e)
      {
        $data=$e;//problmeme maj ready up
        echo json_encode($data);
      }
    }

    function verifEntry($pdo,$login,  $id)
    {
      try
      {
        $requete=$pdo->prepare("SELECT * 
          FROM `user` 
          WHERE (login=?) AND idUser !=?

          ");
        $requete->execute(array($login, $id));
        
        $nbe=$requete->rowCount();
        //echo $login. "---".$phone;
        return $nbe;
      }
      catch(PDOException $e)
      {
        return $e;
      }
    }
     function changeInfo($pdo, $adress,$birthday,$firstName,$idUser,$job,$lastName,$login,$newUser,$password,$phone,$sex,$photo,$mail, $pays)
     {


      try {
        $password=password_hash($password,PASSWORD_BCRYPT,['cost'=>10]);
        $nb=verifEntry($pdo, $login, $idUser);
        if($nb==0 || $nb==1)//on peut gerer la modif sans danger de duplication
            {
              $requete=$pdo->prepare("UPDATE `user` SET `login` = ?, `password` = ?, `lastName` = ?, `firstName` = ?, `phone` = ?, `sex` = ?, `birthday` = ?, `adress` = ?,`pays`=?, `job` = ?, `email` = ?, `newUser` = ? WHERE `user`.`idUser` = ?;
    ");
            $result = $requete->execute(array($login,$password,$lastName,$firstName,$phone,$sex,$birthday,$adress,$pays,$job, $mail, $newUser,$idUser));

            $data['data']="rien";
            $data['message']="rien";
            if($result)
            {
              $data['message']="success";
              $user = getUserInfo($pdo, $login, $password);
              $data['data']=$user['data'];

            }
            else
            {
              $data['message']="error2";
            }
          }
          else
          {
            $data['message']="error";
            $data['info']="une duplication d'une entrée";
            $data['data']=(-1);
          }
        return $data;
      }
      catch(PDOException $e)
          {
            $data=$e;//problmeme ajour nouveau parrain
            echo json_encode($data);
          }


     }
    

    
    function addParrain($id_user, $id_nfilleul, $code)
    {
      global $pdo;

        $id = $id_user;
        $requete=$pdo->prepare("SELECT parrain.idParrain FROM `parrain` WHERE parrain.User_idUser= ?");
        $requete->execute(array($id));
         $idParrainn=$requete->fetch();

        $parrain_existe=$requete->rowCount();

        if($parrain_existe == 0)//pas de parrain existant déja
        {

          //l'ajouter comme nouveau parrain avce nbGene1=1

          try {


              $requete2=$pdo->prepare("INSERT INTO `parrain` ( `nbGene1`, `nbGene2`, `nbGene3`, `User_idUser`) VALUES (?, ?, ?, ?)" );

              $requete2->execute(array('1', '0', '0', $id));
              $idnp = $pdo->lastInsertId();

            $requete3=$pdo->prepare("
              INSERT INTO `parrain_has_code` (`id`, `id_pere`, `code`) VALUES (NULL, ?, ?)

              " );

              $requete3->execute(array($id_user, $code));

            addStep($pdo, $idnp, 0);
            addFilleul($idnp, $id_nfilleul, $id_user);



           }
           catch(PDOException $e)
          {
            $data=$e;//problmeme ajour nouveau parrain
            echo json_encode($data);
          }

        }
        else //cet user est déja un parrain
        {
          //recuperer id du parrain
          //$idParrainn=$idParrainn->idParrain;

          $requete3=$pdo->prepare("
              INSERT INTO `parrain_has_code` (`id`, `id_pere`, `code`) VALUES (NULL, ?, ?)

              " );

              $requete3->execute(array($id_user, $code));

         $idParrainn=$idParrainn->idParrain;

          $requete=$pdo->prepare("SELECT parrain.nbGene1 FROM `parrain` WHERE idParrain=?");
          $requete->execute(array($idParrainn));
          $parrain_nbGene1 = $requete->fetch();
          $parrain_nbGene1 = $parrain_nbGene1->nbGene1;



          if($parrain_nbGene1 == 3)
          {
            //cet parrain a déja atteint le nombre limite de filleule direct 3
            $data['message']="Vous ne pouvez plus ajouter de filleul directement";
            echo json_encode($data);

          }

          else
          {



            //cet parrain peut ajouter un filleul
            //on change dabord son nombre gene1++
            $requete=$pdo->prepare("UPDATE `parrain` SET `nbGene1` = ? WHERE `parrain`.`idParrain` = ?;
");
            $ne=$parrain_nbGene1+1;

           $data['message']="ne ".$ne;
            $requete->execute(array($ne, $idParrainn));


            addFilleul($idParrainn, $id_nfilleul, $id_user);



          }
        }

    }
/*
function getNbgene1($pdo, $id_user)
{
  try
  {

    $requete=$pdo->prepare("SELECT parrain.nbGene1 FROM `parrain` WHERE User_idUser=?");
    $requete->execute(array($id_user));
    $parrain_nbGene1 = $requete->fetch();
    $parrain_nbGene1 = $parrain_nbGene1->nbGene1;

    if($parrain_nbGene1 == 3)
    {
      echo "NBGENE 1: "$parrain_nbGene1;
    }
  }
  catch($e)
  {
    echo json_encode($e);
  }

}*/

function getNumInGenePrincipalParrain($pdo, $id_parrain_in_user)
{
  try {

     $requete=$pdo->prepare("

      SELECT `numInGenePrincipal` FROM `filleuls` WHERE User_idUser=?


      ");
$numInGenePrincipal=0;
    $requete->execute(array($id_parrain_in_user ));
    if ($requete->rowCount()==0) {
      $numInGenePrincipal=0;
    }
    else
    {
    $numInGenePrincipal = $requete->fetch();
    $numInGenePrincipal = $numInGenePrincipal->numInGenePrincipal;
}
    return $numInGenePrincipal;
            
    
  } catch (Exception $e) {
      $data=$e;//problmeme ajour nouveau filleul
          echo json_encode($data);
  }

}

 function addFilleul($idParrain, $id_nfilleul, $id_parrain_in_user)
    {
             // $data['message']="ajout filleul function process";

            global $pdo;

            $numInGenePrincipalParrain=getNumInGenePrincipalParrain($pdo, $id_parrain_in_user);

            $numInGenePrincipalFilleul = $numInGenePrincipalParrain+1;



      try {



              $requete3=$pdo->prepare("INSERT INTO `filleuls` ( `User_idUser`, `Parrain_idParrain`, `Parrain_User_idUser`, `numInGenePrincipal`) VALUES (?,?,?,?);"

           );


            $rs=$requete3->execute(array($id_nfilleul, $idParrain, $id_parrain_in_user,$numInGenePrincipalFilleul));
            if($rs)
            {

             $data['message']="success";
             echo json_encode($data);
            }
            else
            {
              $data['message']="error";
             echo json_encode($data);
            }


         }
         catch(PDOException $e)
        {
          $data=$e;//problmeme ajour nouveau filleul
          echo json_encode($data);
        }

    }

    function addStep($pdo, $idParrain, $num)
    {
      try
      {

        $idP=parrainIdInUser($pdo, $idParrain);
        $id_step=getStepIdFor($pdo, $num);

        $requete2=$pdo->prepare("
          INSERT INTO `parrain_has_step` (`Parrain_idParrain`, `Parrain_User_idUser`, `Step_idStep`)
          VALUES (?,?,?)
" );
        $requete2->execute(array($idParrain, $idP, $id_step));
        return $requete2;

      }
      catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
    }

    function addStep2($pdo, $idpere_in_user, $num)
    {
      try
      {
        $idParraininParrain=parrainIdinParrainByUserId($pdo, $idpere_in_user);
        $id_step=getStepIdFor($pdo, $num);

         $requete2=$pdo->prepare("
          INSERT INTO `parrain_has_step` (`Parrain_idParrain`, `Parrain_User_idUser`, `Step_idStep`)
          VALUES (?,?,?)
" );
        $requete2->execute(array($idParraininParrain, $idpere_in_user, $id_step));
        return $requete2;
      }
      catch(PDOException $e)
      {
        $data=$e;//problmeme ajour nouveau parrain
        echo json_encode($data);
      }
    }

   function parrainIdInUser($pdo, $id_in_parrain)
   {
      $requete=$pdo->prepare("SELECT parrain.User_idUser FROM `parrain` WHERE idParrain=?");
      $requete->execute(array($id_in_parrain));
      $iduser=$requete->fetch();
      $iduser = $iduser->User_idUser;

      return $iduser;
   }
   function parrainIdinParrainByUserId($pdo, $id_user)
   {
      $requete=$pdo->prepare("SELECT parrain.idParrain FROM `parrain` WHERE User_idUser=?");
      $requete->execute(array($id_user));
      $idp=$requete->fetch();
      $idp = $idp->idParrain;

      return $idp;
   }
   function getStepIdFor($pdo, $num)
   {
      $requete=$pdo->prepare("SELECT step.idStep FROM `step` WHERE num=?");
      $requete->execute(array($num));
      $idStep=$requete->fetch();
      $idStep = $idStep->idStep;


      return $idStep;
   }

    function getNumForStepId($pdo, $step_id)
   {
      $requete=$pdo->prepare("SELECT step.num FROM `step` WHERE idStep=?");
      $requete->execute(array($step_id));
      $idStep=$requete->fetch();
      $idStep = $idStep->num;


      return $idStep;
   }

   function getStepIdForParrain($pdo, $idparrain)
   {
      $requete=$pdo->prepare("SELECT Step_idStep FROM `parrain_has_step` WHERE Parrain_User_idUser =?");
      $requete->execute(array($idparrain));
      $nb_step = $requete->rowCount();
      if($nb_step==0)
      {
        return (-1);
      }
      else
      {
        $ids=$requete->fetch();
        $ids = $ids->Step_idStep;
      }

      return $ids;
   }
   function getStepNumForParrain($pdo, $idparrain)
   {

      $ids = getStepIdForParrain($pdo, $idparrain);
      $data['data']="";
      $data['message']="";
      if($ids == (-1))
      {
           $data['message']="error";
      }
      else
      {
        $requete=$pdo->prepare("SELECT num FROM `step` WHERE idStep =?");
        $requete->execute(array($ids));
        $snum=$requete->fetch();
        $snum = $snum->num;
        $data['message']="success";
        $data['data']=$snum;

      }

      return $data;



   }

   function newUserConnect($pdo, $userId, $s,$b,$i,$a,$j)
   {
    $requete_nuc=$pdo->prepare("
        UPDATE `user` SET `sex` = ?, `birthday` = ?, `inscriptionDate` = ?, `adress` = ?, `job` = ?, `newUser` = '0'
         WHERE `user`.`idUser` = ?

      ");
    $requete_nuc->execute(array($s,$b,$i,$a,$j, $userId));
    if($requete_nuc)
    {
      return "good";
    }
    else
    {
      return "bad";
    }


   }

   function getUserInfo($pdo, $pseudo,  $pass)
   {
      $requete_pseudo=$pdo->prepare("SELECT * FROM `user` WHERE login =?");
      $requete_pseudo->execute(array($pseudo));
      $pseudo_existe=$requete_pseudo->rowCount();


     if($pseudo_existe!=0)
      {
        $user['data']="rien";
        $user['message']="rien";

         $user['data']=$requete_pseudo->fetch();
     
        if (password_verify($pass,$user['data']->password)) {
        // if (($pass==$user['data']->password)) {
                  $user['message']="success";


          }
          else
          {
            $user['message']="error";
          }
      }
      else
      {
            $user['message']="error";
      }

      return $user;

   }



   function connexion($pdo, $pseudo)
   {
      $pseudo   = filter_var($obj->pseudo, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
      $password  = filter_var($obj->password, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

      $requete_pseudo=$bdd->prepare("SELECT * FROM `user` WHERE pseudo=?");
      $requete_pseudo->execute(array($pseudo,$pseudo));
      $pseudo_existe=$requete_pseudo->rowCount();
      $data1 = $requete_pseudo->fetch();

      if($pseudo_existe!=0)
      {


        //hashage afta
        /*if(password_verify($password,$data1[0]->password))
        {
          echo json_encode($data1);
        }
        else
          echo json_encode(0);
      }
      else
      {
        echo json_encode(0);
      }*/
   }
 }

 function whoAdd($pdo, $id)
   {
      try {

        $requete_geneFocus=$pdo->prepare("SELECT geneFocus FROM `filleuls` WHERE User_idUser=?");
      $requete_geneFocus->execute(array($id));

      $geneFocus_existe=$requete_geneFocus->rowCount();
      if($geneFocus_existe==1)
        $geneFocus = $requete_geneFocus->fetch();
        $geneFocus=$geneFocus->geneFocus;

        $list_filleul_de_genePrincipal_geneFocus=getAllFilleulsOfGene($pdo, $geneFocus);




        
      } catch (Exception $e) {
        
      }
   }

   function getAllFilleulsOfGene($pdo, $gene)
   {
      try {

        $requete_gene=$pdo->prepare("SELECT `User_idUser` FROM `filleuls` WHERE numInGenePrincipal=?");
      $requete_gene->execute(array($gene));

      $gene_existe=$requete_gene->rowCount();
      if($gene_existe =!0)
        $list_filleu_de_gene = $requete_gene->fetchAll();

      return $list_filleu_de_gene;
        
      } catch (Exception $e) {
        
      }
   }

  function tes()
  {
    echo "test";
    if (true) {
      // code...

      
    }
  }


?>

