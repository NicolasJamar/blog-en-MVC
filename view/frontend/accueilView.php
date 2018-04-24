
<?php $title = "Mon blog";

 ob_start(); ?>

        <h1>Mon super blog !</h1>

        <p>Derniers billets du blog :</p>
 
<?php while ($posts = $req->fetch()){       ?>

        <div class="news">
            <h3>
                <?php echo htmlspecialchars($posts['titre']); ?>
                <em>le <?php echo $posts['date_creation_fr']; ?></em>
            </h3>

            <p>
           	<?php  echo nl2br(htmlspecialchars($posts['contenu'])); ?>
            <br />
            <em><a href="index.php?action=comment&id=<?php echo $posts['id'] ?>">Commentaires</a></em>
            </p>
        </div>

        <?php

        }

        $req->closeCursor();

$content = ob_get_clean();

require('template.php');

        

