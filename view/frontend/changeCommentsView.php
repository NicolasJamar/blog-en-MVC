<?php $title = "Coms du blog";

ob_start();

?>

<a href="index.php?action=accueil">Retour à l'accueil</a>  


    <h1>Mon super blog !</h1>

        <!--  -->


        <h2>Modifier le commentaire</h2>

        <?php 

        // while($comments = $commentaire->fetch()){

        // foreach ($commentaire as $key => $value) {
            # code...
        var_dump($commentaire['auteur']);

            ?>
        
        <form action="index.php?action=changeComment&id=<?php echo $commentaire['id_billet'] ?>&id_comment=<?php echo $commentaire['id'] ?>" method="post">
            <label for="auteur">Pseudo : </label><br>
            <input type="text" value="<?php echo $commentaire['auteur']?>" name="auteur"><br>
            
            <label for="commentaire">Commentaire : </label><br>
            <textarea name="commentaire" cols="30" rows="10"><?php echo $commentaire['commentaire'] ?></textarea>
            <br>
            <input type="submit" value="Modifier">
        </form>

        <?php  

        // }

    

$content = ob_get_clean();

require('template.php');