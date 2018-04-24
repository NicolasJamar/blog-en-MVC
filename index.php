<?php

//ROUTER

require('controler/frontend.php');

if(isset($_GET['action'])){

	if($_GET['action'] == "accueil"){

	accueilControler();

	} 

	else if($_GET['action'] == "comment"){

		if (isset($_GET['id']) AND $_GET['id'] > 0) {
			
			postControler();

		} else {

   		 	echo 'Erreur : aucun identifiant de billet envoyé';
		}

	}

	else if($_GET['action'] == "addComment"){

		if(isset($_POST['auteur']) AND isset($_POST['commentaire'])) {

				commentsControler($_GET['id'], $_POST['auteur'], $_POST['commentaire']);
				
		} else {

		echo "Vous n'avez pas rempli tous les champs";
		}

	}

	else if($_GET['action'] == "showSingleComment"){

		if (isset($_GET['id_comment']) AND $_GET['id_comment'] > 0 AND isset($_GET['id']) AND $_GET['id'] > 0) {

			singleCommentManager();
			

		} else {

			echo "Le lien ne fonctionne pas, revenez en arrière !";
		}
	}

	else if ($_GET['action'] == "changeComment") {
		
		if (isset($_GET['id_comment']) AND $_GET['id_comment'] > 0 AND isset($_GET['id']) AND $_GET['id'] > 0) {

			changeCommentControler($_GET['id_comment'], $_POST['auteur'], $_POST['commentaire']);

		} else{

			echo "Veuillez remplir tous les champs !";
		}
	}

} else{

	accueilControler();
}

