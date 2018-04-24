<?php

namespace Openclassroom\blog\MVC\model;

require_once('Manager.php');

class PostManager extends Manager{


    //Pour afficher tous les articles (posts)
    public function getPosts(){
        
        $db = $this->connectDb();

        $req = $db->query('SELECT id, titre, contenu, DATE_FORMAT(date_creation, \'%d/%m/%Y à %Hh%imin%ss\') AS date_creation_fr 
            FROM billets 
            ORDER BY date_creation 
            DESC LIMIT 0, 5');

        return $req;
    }

    //for commentsView.php -> afficher l'article selon l'id
    public function getPost($postId){

        $db = $this->connectDb();

        $req = $db->prepare('SELECT id, titre, contenu, DATE_FORMAT(date_creation, \'%d/%m/%Y à %Hh%imin%ss\') AS date_creation_fr 
            FROM billets 
            WHERE id = ?');

        $req->execute(array( $postId ));
        $post = $req->fetch();

        return $post;
    }

}