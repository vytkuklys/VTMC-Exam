<?php
    include_once('./includes/dbh.inc.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css?rel=123">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/85a9462cb0.js" crossorigin="anonymous"></script>
    <title>U_Vytautas_Kuklys</title>
</head>
<!-- SELECT kursai.*, autoriai.Vardas, autoriai.Pavarde, COUNT(komentarai.Kurso_id) as Total_comments
                        FROM `kursai` 
                        LEFT JOIN komentarai 
                        ON komentarai.Kurso_id = kursai.Kurso_id
                        RIGHT JOIN autoriai
                        ON autoriai.Autoriaus_id = kursai.Autoriaus_id
                        GROUP BY kursai.Kurso_id
                        ORDER BY kursai.Kurso_id -->
<body>
    <header class="shadow mb-5 bg-white">
        <a href="#">
            <img src="./img/logo.jpg" class="logo d-inline-block align-top" alt="">
        </a>
    </header>
    <section class="container">
        <h2>Naujausi kursai</h2>
        <div class="c-cards">
        <?php
                try {
                    $connectM = new PDO("mysql:host=$host; dbname=$dbName", $user, $pass);
                    $connectM->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "
                        SELECT kursai.*, autoriai.Vardas, autoriai.Pavarde, COUNT(komentarai.Kurso_id) as Total_comments
                            FROM `kursai` 
                            LEFT JOIN komentarai 
                            ON komentarai.Kurso_id = kursai.Kurso_id
                            RIGHT JOIN autoriai
                            ON autoriai.Autoriaus_id = kursai.Autoriaus_id
                            GROUP BY kursai.Kurso_id
                            ORDER BY kursai.Kurso_id";
                    $result = $connectM->prepare($sql);
                    $result->execute();
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        // if(isset($row['Profilio_nuotrauka']) && !empty($row['Profilio_nuotrauka'])){
                        //     $userPhoto = "./uploads/".$row['Profilio_nuotrauka'];
                        // }else{
                        //     $userPhoto = "./images/panda.png";
                        // }
                        echo 
                        "
                            <div class=\"card shadow\" style=\"width: 18rem;\">
                                <img src=\"".$row['Nuotraukos_path']."\" alt=\"Card image cap\">
                                <div class=\"card-body\">
                                    <a class=\"card-title\" href=\"#\">".$row['Pavadinimas']."</a>
                                    <p class=\"card-author\">".$row['Vardas']." ".$row['Pavarde']."</p>
                                    <hr>
                                    <p class=\"card-text\">".$row['Trumpas_aprasas']."</p>
                                    <hr>
                                    <!-- <p class=\"d-inline\">5</p> -->
                                    <div class=\"stars\">                        
                                    </div>
                                    <div>
                                    <p>".$row['Reitingas']."</p>
                                    <div class=\"stars\" id=\"".$row['Kurso_id']."\">
                                        <input type=\"radio\" name=\"rate\" id=\"".$row['Kurso_id']."5\" class=\"star\" value=\"5\">
                                        <label for=\"".$row['Kurso_id']."5\" class=\"fas fa-star\"></label>
                                        <input type=\"radio\" name=\"rate\" id=\"".$row['Kurso_id']."4\" value=\"4\" class=\"star\">
                                        <label for=\"".$row['Kurso_id']."4\" class=\"fas fa-star\"></label>
                                        <input type=\"radio\" name=\"rate\" id=\"".$row['Kurso_id']."3\" value=\"3\" class=\"star\">
                                        <label for=\"".$row['Kurso_id']."3\" class=\"fas fa-star\"></label>
                                        <input type=\"radio\" name=\"rate\" id=\"".$row['Kurso_id']."2\"  value=\"2\" class=\"star\">
                                        <label for=\"".$row['Kurso_id']."2\" class=\"fas fa-star\"></label>
                                        <input type=\"radio\" name=\"rate\" id=\"".$row['Kurso_id']."1\" value=\"1\" class=\"star\">
                                        <label for=\"".$row['Kurso_id']."1\" class=\"fas fa-star\"></label>
                                    </div>
                                        <div class=\"comments\">
                                            <p><i class=\"fas fa-comment\"></i>".$row['Total_comments']."</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ";    
                    }
                    
                } catch (PDOException $error) { 
                        echo $error->getMessage();
                }
            ?>
        </div>
    </section>
    <section class="container container-form">
        <h2>Sekite naujienas</h2>
        <p>Norite gauti pranešimus apie naujus kursus? Užsisakykite mūsų naujienlaiškį!</p>
        <form>
            <div class="form-group mb-3">
              <label for="exampleInputEmail1">Vardas</label>
              <input type="email" class="form-control" id="vardas" aria-describedby="emailHelp">
            </div>
            <div class="form-group mb-3">
              <label for="exampleInputPassword1">EL paštas</label>
              <input type="password" class="form-control" id="el-pastas">
            </div>
            <button type="submit" class="btn">Užsisakyti</button>
          </form>
    </section>
    <footer>
        <hr>
        <p>&copy; 2021 Vytautas Kuklys</p>
    </footer>
    <!-- <div class="alert-box">
        <p>Būtina užpildyti visus laukus!</p>
        <button>Gerai</button>
    </div> -->
    <script src="script.js"></script>
    <script>
        const stars = document.querySelectorAll('.star');

        stars.forEach(star =>{
            star.addEventListener('click', ()=>console.log('star'))
        })
    </script>
</body>

</html>