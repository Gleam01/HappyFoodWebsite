<?php
  include_once 'connect_db.php';

  function key_verification($key)
  {
     // Determine which mode is being requested
     switch($key)//suivant la cl�e fournie par l'application on effectue une action
     {


  	  // Add a new record to the technologies table

  	    case "verif_code":
              $code = filter_var($obj->code, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
              $bon = verification_code($pdo, $code);

              if($bon)
              {
                $data['message']="success";
              supprimer_code($pdo, $code);

                echo json_encode($data);
              }
              else
              {
                $data['message']="error";
                echo json_encode($data);
              }


             break;
          case "enter_code":
              $size = filter_var($obj->size, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

              $data=creation_mots_de_passe($pdo, $size);

              echo json_encode($data);

             break;
          case "delete_code":
              $code = filter_var($obj->code, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

              $result = supprimer_code($pdo, $code);
              $data['message']="sucess";
              echo json_encode($data);

             break;

          case "get_code":
              $nb = filter_var($obj->nb, FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

              $result = get_code($pdo, $nb);

              echo json_encode($result);

             break;
      }
    }

function get_code($pdo, $nb)
{
  try
      {
        $requete=$pdo->query("
          SELECT * FROM `codesvalidation`
          WHERE `deja_genere`= 0
          LIMIT $nb
          ");

        $nb_codes=$requete->rowCount();

        if($nb_codes==0)
        {
          //pas de reusltat
          $data['message']="error";
          $data['data']=(-1);

           return $data;
        }
        else
        {
          $codes = $requete->fetchAll();
          foreach ($codes as $key => $code) {
            $data['data'][]=$code['code'];

            set_deja_genered($pdo, $code['code']);
          }
          $data['message']="sucess";

           return $data;

        }


      }
      catch(PDOException $e)
      {
        echo $e;
      }
}
function set_deja_genered($pdo, $code)
{
  try
      {
        $requete=$pdo->prepare("
          UPDATE `codesvalidation`
          SET `deja_genere` = '1'
          WHERE `codesvalidation`.`code` = ?;


          ");
        $requete->execute(array($code));

        return $requete;
      }
      catch(PDOException $e)
      {
        echo json_encode($e);
      }
}

function verification_code($pdo, $code)
{
	try
      {
        $requete=$pdo->prepare("
        	SELECT * FROM `codesvalidation` WHERE `code`=?
          ");
        $requete->execute(array($code));

        $nb=$requete->rowCount();
        if($nb==0)
        {
        	return false;
        }
        else if($nb==1)
        {
        	return true;
        }
      }
      catch(PDOException $e)
      {
        echo json_encode($e);
      }
}

function supprimer_code($pdo, $code)
{
	try
      {
        $requete=$pdo->prepare("
        	DELETE FROM `codesvalidation`
        	WHERE `codesvalidation`.`code` = ?;

          ");
        $requete->execute(array($code));

        return $requete;
      }
      catch(PDOException $e)
      {
        echo json_encode($e);
      }
}

function Genere_Password($size)
{
	// Initialisation des caract�res utilisables
	$characters = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");

	$password="_";
	for($i=0;$i<$size;$i++)
	{
		$password .= ($i%2) ? strtoupper($characters[array_rand($characters)]) : $characters[array_rand($characters)];
	}

	return $password;
}


// Petit exemple
$les_mots_de_passe=array();

function creation_mots_de_passe($pdo, $size, $number)
{

	$les_mots_de_passe=array();

	$j=0;
  $data['message']="";
  $data['data']="";
	for ($i=0; $i < $number; $i++) {
		$mon_mot_de_passe = Genere_Password($size);
			if(in_array($mon_mot_de_passe, $les_mots_de_passe))
			{
				$mon_mot_de_passe."**";
        $data['message']="error";
        $data['info']="Il y a eu duplication de code";
			}
			else
			{
				$result = ajouter_mdp_database($pdo, $mon_mot_de_passe);
        if(!$result)
        {
          $data['message']="error";
          $data['info']="Une errur lors de l'ajout dans la base de donn�e";
        }
			}

			/*if(($j%100)==0) {$j--;}
			else {$j++;}*/
		$les_mots_de_passe[]=$mon_mot_de_passe;
    $data['data']=$les_mots_de_passe;
	}

      return $data;

}

	function ajouter_mdp_database($pdo, $mon_mot_de_passe)
	{
		try
      {
        $requete=$pdo->prepare("
        	INSERT INTO `codesvalidation` (`idCodesValidation`, `code`, `selt`)
        	VALUES (NULL, ?, 0);
        ");
        $requete->execute(array($mon_mot_de_passe));

        return $requete;
      }
      catch(PDOException $e)
      {
        echo json_encode($e);
      }
	}
?>
