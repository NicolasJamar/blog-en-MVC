<?php

//CONTROLER

use Openclassroom\blog\MVC\model\PostManager;
use Openclassroom\blog\MVC\model\CommentManager;

require_once('./model/PostManager.php');
require_once('./model/CommentManager.php');

function accueilControler(){

	$postManager = new PostManager(); //création d'un objet à partir de la class PostManager
	$req = $postManager->getPosts(); //on va chercher la fonction de l'objet

	require('./view/frontend/accueilView.php');
}


function postControler(){

	$postManager = new PostManager();
	$post = $postManager->getPost($_GET['id']);

	$commentManager = new CommentManager();
	$comments = $commentManager->getComments($_GET['id']);

	require('./view/frontend/commentsView.php');
}


function commentsControler($id_billet, $auteur, $commentaire){

	$commentManager = new CommentManager();
	$writeComment = $commentManager->writeComment($id_billet, $auteur, $commentaire);

	header('Location: index.php?action=comment&id=' . $id_billet );
}

function singleCommentManager(){

	$commentManager = new CommentManager();
	$commentaire = $commentManager->getSingleCommentForUpdating($_GET['id_comment']);
	$commentaire = $commentaire->fetch();

	require('./view/frontend/changeCommentsView.php');
}


function changeCommentControler($id_comment, $nvauteur, $nvcommentaire){

	$commentManager = new CommentManager();
	$changeComment = $commentManager->changeComment($id_comment, $nvauteur, $nvcommentaire);

	header('Location: index.php?action=comment&id=' . $_GET['id']);
}