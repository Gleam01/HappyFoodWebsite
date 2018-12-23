<?php


__MAIN__();

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

   function getAllFilleulsOfGene($pdo, $geneFocus)
   {
      try {

        $requete_gene=$pdo->prepare("SELECT `User_idUser` FROM `filleuls` WHERE numInGenePrincipal=?");
      $requete_gene->execute(array($geneFocus));

      $gene_existe=$requete_gene->rowCount();
      if($gene_existe =!0)
        $list_filleu_de_gene = $requete_gene->fetchAll();

      return $list_filleu_de_gene;
        
      } catch (Exception $e) {
        
      }
   }

   function getMiniNbGeneAftertrieNbGene($parrainIdGene)
   {
    $lesGene=array();

    foreach ($parrainIdGene as $key => $value) {
      $lesGene[$key]=$value['nbGene1'];
    }
    sort($lesGene);

    echo "<pre>";
    print_r($lesGene);
    echo "</pre>";

    return $lesGene[0];
   }

   function get_first_who_has_this_miniNbGene($mini_nbgene, $parrainIdGene)
   {
      foreach ($parrainIdGene as $key => $value) {
        if($value['nbGene1']==$mini_nbgene) return $value['godson'];
      }
  
   }

   function increaseFocus($pdo, $id)
   {
     $request = $pdo->prepare("SELECT geneFocus FROM filleuls WHERE User_idUser = ?");
     $request->execute(array($id));
     $geneFocus = $request->fetch();
     $geneFocus = $geneFocus['geneFocus'] + 1;
     $request = $pdo->prepare("UPDATE filleuls SET geneFocus = ? WHERE User_idUser = ?");
     $request->execute(array($geneFocus, $id));
   }

   function __MAIN__()
   {
    $characters=[0,3];
   for($i=0;$i<10;$i++)
   {

      $gene_i=$characters[array_rand($characters)];//just for test

      $parrainIdGene[]=
        [
         'godson' => $i, //this must be id of the user
         'nbGene1' => $gene_i
        ];
   }

   //assume that we have in $parrainIdGene every godfather who respects condition  geneFocus == numInGenePrincipal

    echo "<pre>";
    print_r($parrainIdGene);
    echo "</pre>";

    $mini_nbgene=getMiniNbGeneAftertrieNbGene($parrainIdGene);

    if($mini_nbgene==3)
    {
      increaseFocus();
    }
    else
    {
          $parrain_to_whom_added=get_first_who_has_this_miniNbGene($mini_nbgene, $parrainIdGene);

        echo "\n We must add filleul to ".$parrain_to_whom_added;
       }
    }

    

   

   ?>