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
              <span><?php echo $liste["ad"]; ?></span><br><br>
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
          <p>Yiğit Bayraktaroğlu</p>
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

    <?php

    $kategoriCek = $db->prepare("SELECT * FROM kategori");
    $kategoriCek->execute();
    $kategori = $kategoriCek->fetchAll();



    foreach ($kategori as $katName) { ?>
      <div class="spotify-playlists">
        <h2> <?php echo $katName["ad"]; ?> </h2>
        <?php
        $sarkiCek = $db->prepare("SELECT * from sarkilar where kategori_id=:id");
        $sarkiCek->execute([":id" => $katName["id"]]);
        $sarki = $sarkiCek->fetchAll();?>
        
        <div class="list"><?php
        foreach ($sarki as $sarkiBilgi) { ?>
          
            <div class="item">
              <img src="resimler/<?php echo $sarkiBilgi["resim_yolu"]; ?>.png" alt="<?php echo $sarkiBilgi["sarkici"] ?>" />
              <a href="sarkibilgi.php?id=<?php echo $sarkiBilgi["id"]; ?>">
                <div class="play">
                  <span class="fa fa-plus"></span>
                </div>
              </a>
              <h4><?php echo $sarkiBilgi["sarkici"]; ?></h4>
              <p><?php echo $sarkiBilgi["sarki_ad"]; ?></p>
            </div>
            &nbsp;
          <?php
        }
          ?>


          
      </div>
      </div>
    <?php
    }

    ?>




    <script src="https://kit.fontawesome.com/23cecef777.js" crossorigin="anonymous"></script>

</body>

</html>