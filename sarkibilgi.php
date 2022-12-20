<?php
include "function.php";
if ($_SESSION["uye"] == 0) {
    header("Location:login.php");
    exit;
}

$uyeBilgi = $db->prepare("SELECT * FROM uye WHERE mail=:mail");
$uyeBilgi->execute([":mail" => $_SESSION["email"]]);
$uye = $uyeBilgi->fetch(PDO::FETCH_ASSOC);



?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surplus</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="sidebar">
        <div class="logo">
            <a href="#">
                <img src="https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_CMYK_Green.png" alt="Logo" />
            </a>
        </div>

        <div class="navigation">
            <ul>
                <li>
                    <a href="index.php">
                        <span class="fa fa-home"></span>
                        <span>Anasayfa</span>
                    </a>
                </li>

            </ul>
        </div>

        <div class="navigation">
            <ul>
                <li>
                    <form action="function.php" method="post">
                        <input type="hidden" value="<?php echo $uye["id"]; ?>" name="uye_id">
                        <span style="color: #b3b3b3;" class="fa fas fa-plus-square"></span>
                        <input class="button" value="Yeni çalma listesi oluştur" type="submit" name="calmalistesi">
                    </form>
                </li>
            </ul>
        </div>

        <div class="navigation">
            <hr>
            <ul>
                <li>
                    <?php

                    $listecek = $db->prepare("SELECT * FROM calmalistesi WHERE user_id=:id");
                    $listecek->execute([":id" => $uye["id"]]);
                    $listedurum = $listecek->fetchAll();
                    foreach ($listedurum as $liste) { ?>
                        <a href="calmalistesi.php?id=<?php echo $liste["id"]; ?>">
                            <span><?php echo $liste["ad"]; ?></span><br>
                        </a>
                    <?php
                    }
                    ?>
                </li>
            </ul>
        </div>

        <div class="policies">
            <ul>
                <li>
                    <p>Hamza Can Korkmaz</p>
                </li>
                <li>
                    <p>Hamza Can Korkmaz</p>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-container">
        <div class="topbar">
            <div class="prev-next-buttons">
                <!-- kontrol edilecek -->
            </div>

            <div class="navbar">
                <?
                if ($_SESSION["uye"] == 1) { ?>
                    <ul>
                        <li>
                            <a href="logout.php">Çıkış Yap</a>
                        </li>
                    </ul>
                    <button type="button"><?php echo $uye["ad"] . " " . $uye["soyad"];  ?></button>
                <?
                } else { ?>
                    <!-- kontrol -->
                <?
                }
                ?>

            </div>
        </div>

        <h1 style="color:#fff; text-align:center;"> Şarkı Bilgileri </h1>
        <div class="spotify-playlists">
        <h2>Çalma Listesine Ekle</h2>
        <ul style="list-style-type: none; color:#fff;">
        <?php

        $listecek = $db->prepare("select * from calmalistesi where user_id =:id and id NOT IN (SELECT calmalistesisarkilar.id FROM calmalistesisarkilar WHERE calmalistesisarkilar.sarki_id =:sarki_id)");
        $listecek->execute([":id" => $uye["id"],":sarki_id"=>$_GET["id"]]);
        $listedurum = $listecek->fetchAll();
        foreach ($listedurum as $liste) { ?>
        <li style="margin-bottom: 1rem;">
            <a style="color: #b3b3b3; text-decoration:none;" href="function.php?id=<?php echo $liste["id"]; ?>&sarki_id=<?php echo $_GET["id"]; ?>">
                <span><?php echo $liste["ad"]; ?></span><br>
            </a>
        </li>
        <?php
        }
        ?>
        </ul>
        </div>




        <script src="https://kit.fontawesome.com/23cecef777.js" crossorigin="anonymous"></script>

</body>

</html>