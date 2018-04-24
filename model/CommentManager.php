<?php

namespace Openclassroom\blog\MVC\model;

require_once('Manager.php');

class CommentManager extends Manager{

	public function getComments($postId){
	    
	    $db = $this->connectDb();

	    $comments = $db->prepare('
	        SELECT id, id_billet, auteur, commentaire, DATE_FORMAT(date_commentaire, \'%d/%m/%Y à %Hh%imin%ss\') AS date_commentaire_fr 
	        FROM commentaires 
	        WHERE id_billet = ?
	        ORDER BY date_commentaire DESC');

	    $comments->execute(array( $postId ));

	    return $comments;
	}

	public function writeComment($id_billet, $auteur, $commentaire){
	    
	    $db = $this->connectDb();

	    $addComment = $db->prepare('
	        INSERT INTO commentaires (id_billet, auteur, commentaire, date_commentaire)
	        VALUES( :id_billet, :auteur, :commentaire, NOW() )');

	    $addComment = $addComment->execute(array(
	        'id_billet'=> $id_billet,
	        'auteur'=> $auteur,
	        'commentaire' => $commentaire
	        ));

	    return $addComment;
	}

	public function getSingleCommentForUpdating($id_comment){
	    
	    $db = $this->connectDb();

	    $comments = $db->prepare('
	        SELECT id, id_billet, auteur, commentaire, DATE_FORMAT(date_commentaire, \'%d/%m/%Y à %Hh%imin%ss\') AS date_commentaire_fr 
	        FROM commentaires 
	        WHERE id = ?
	        ');

	    $comments->execute(array( $id_comment ));

	    return $comments;
	}

	public function changeComment($id_comment, $nvauteur, $nvcommentaire){

		$db = $this->connectDb();

		$updateComment = $db->prepare('
			UPDATE commentaires SET
			auteur = :nvauteur,
			commentaire = :nvcommentaire
			WHERE id = :idcomment');

		$updateComment = $updateComment->execute(array(
			'nvauteur' => $nvauteur,
			'nvcommentaire' => $nvcommentaire,
			'idcomment' => $id_comment
			));

		return $updateComment;
	}

}