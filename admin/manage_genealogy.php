<?php
    #Début optimisation pour choisir le filleul adéquat
    function toWhomToAdd($pdo, $id, $login)
    {
        $data = whoAdd($pdo, $id, $login);
        if(!$data) return "La requête n'a pas abouti, Contactez l'administrateur.";
        elseif($data == "pas_admin") return "Vous n'ếtes habileté à faire cette opération.";
        elseif ($data == "pas_genefocus") return "Votre focus de génération n'est pas adéquat.";
        else {
            $toSort = reformatGodsonsForSorting($pdo, $data);
            $miniNbGene = getMiniNbGeneAfterSorting($toSort);
            if($miniNbGene >=0 && $miniNbGene < 3) return get_first_who_has_this_miniNbGene($miniNbGene, $toSort);
            elseif($miniNbGene == 3) {
                incrementGeneFocus($pdo, $id);
                return toWhomToAdd($pdo, $id, $login);
            }
        }
    }

    function whoAdd($pdo, $id, $login)
    {
        if($login == 'admin1' OR $login == 'admin2' OR $login == 'admin3') {
            $requete_geneFocus = $pdo->prepare("SELECT geneFocus FROM `filleuls` WHERE User_idUser=?");
            $requete_geneFocus->execute(array($id));
            $geneFocus_existe=$requete_geneFocus->rowCount();
            if($geneFocus_existe==1) {
                $geneFocus = $requete_geneFocus->fetch();
                $geneFocus=$geneFocus['geneFocus'];
                return getAllFilleulsOfGene($pdo, $geneFocus);
            }
            return "pas_genefocus";
        }
        return "pas_admin";
    }
 
    function getAllFilleulsOfGene($pdo, $gene)
    {
        $requete_gene=$pdo->prepare("SELECT `User_idUser` FROM `filleuls` WHERE numInGenePrincipal=?");
        $exec = $requete_gene->execute(array($gene));
        if($exec)
            return $requete_gene;
        return $exec;
    }
 

    function reformatGodsonsForSorting($dao, $data)
    {
        $formatedGodsonsToSort = [];
        while ($godson = $data->fetch()) {
            $query = $dao->prepare('SELECT nbGene1 FROM parrain WHERE User_idUser = ?');
            $query->execute(array($godson['User_idUser']));
            $query_count = $query->rowCount();
            if ($query_count == 1) {
                $godsonNbGene1 = $query->fetch();
                $godsonNbGene1 = intval($godsonNbGene1['nbGene1']);
                $formatedGodsonsToSort = array_merge($formatedGodsonsToSort, [[
                    'idUser' => intval($godson['User_idUser']),
                    'nbGene1' => $godsonNbGene1
                ]]);
            }
            else {
                $formatedGodsonsToSort = array_merge($formatedGodsonsToSort, [[
                    'idUser' => intval($godson['User_idUser']),
                    'nbGene1' => 0
                ]]);
            }
        }
        echo "format \n";
        var_dump($formatedGodsonsToSort);
        return $formatedGodsonsToSort;
    }

    function getMiniNbGeneAfterSorting($data)
    {
        $nbGeneArray = array();
        foreach ($data as $key => $value)
            $nbGeneArray[] = $value['nbGene1'];
        sort($nbGeneArray);
        echo "sorting issue";
        echo "<pre>";
        print_r($nbGeneArray);
        echo "</pre>";
        return $nbGeneArray[0];
    }
 
    function get_first_who_has_this_miniNbGene($mini_nbgene, $data)
    {
        foreach ($data as $key => $value) {
            if($value['nbGene1']==$mini_nbgene) return intval($value['idUser']);
        }
    }
 
    function incrementGeneFocus($pdo, $id)
    {
      $request = $pdo->prepare("SELECT geneFocus FROM filleuls WHERE User_idUser = ?");
      $request->execute(array($id));
      $geneFocus = $request->fetch();
      $geneFocus = $geneFocus['geneFocus'] + 1;
      $request = $pdo->prepare("UPDATE filleuls SET geneFocus = ? WHERE User_idUser = ?");
      $request->execute(array($geneFocus, $id));
    }
    #Fin optimisation
