<?php $title = "Coms du blog";

ob_start();

?>

<a href="index.php?action=accueil">Retour à l'accueil</a>  


    <h1>Mon super blog !</h1>

        <p>Commentaires de l'article  :</p>


        <div class="news">
            <h3>
                <?php echo htmlspecialchars($post['titre']); ?>
                <em>le <?php echo $post['date_creation_fr']; ?></em>
            </h3>

            <p>
           	<?php  echo nl2br(htmlspecialchars($post['contenu'])); ?>
            </p>
        </div>


        <h2>Commentaires</h2>
        
        <form action="index.php?action=addComment&id=<?php echo $post['id'] ?>" method="post">
            <label for="auteur">Pseudo : </label><br>
            <input type="text" name="auteur"><br>
            
            <label for="commentaire">Commentaire : </label><br>
            <textarea name="commentaire" cols="30" rows="10"></textarea>
            <br>
            <input type="submit" value="Envoyer">
        </form>

        <?php while ($comment = $comments->fetch()) { ?>
        <p><strong><?php echo $comment['auteur'] ?></strong>, le <?php echo $comment['date_commentaire_fr']; ?> : 
            (<a href="index.php?action=showSingleComment&id=<?php echo $comment['id_billet'] ?>&id_comment=<?php echo $comment['id'] ?>">Modifier</a>)</p>

        <p><?php echo $comment['commentaire'] ?></p>


        <?php  

        } 

$comments->closeCursor();

$content = ob_get_clean();

require('template.php');


        

