<?php
ob_start();
session_start();
$servername = "localhost";
$username = "root";
$password = "";

try {
  $db = new PDO("mysql:host=$servername;dbname=surplus", $username, $password);

  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
  exit;
}


if(isset($_POST['girisyap'])){
    $email = $_POST['email'];
    $sifre = $_POST['sifre'];

    $uyeKontrol=$db->prepare("SELECT * FROM uye WHERE mail=:mail and sifre=:sifre");
    $uyeKontrol->execute([":mail"=>$email,":sifre"=>$sifre]);

    if($uyeKontrol->rowCount() > 0){
        $_SESSION["email"] = $email;
        $_SESSION["sifre"] = $sifre;
        $_SESSION["uye"] = 1;
        header("Location:index.php");
    }else{
        header("Location:login.php?uye=hata");
        $_SESSION["uye"] = 0;
    }

}

if(isset($_POST['kayitol'])){

    $ad = $_POST['ad'];
    $soyad = $_POST['soyad'];
    $email = $_POST['email'];
    $sifre = $_POST['sifre'];

    $uyeKontrol = $db->prepare("SELECT * FROM uye WHERE mail=:mail");
    $uyeKontrol->execute(["mail"=>$email]);
    $uyeSay = $uyeKontrol->rowCount();
    
    if($uyeSay < 1 ){
        
        $uyeEkleSorgu = $db->prepare("INSERT INTO uye SET ad=:ad,soyad=:soyad,mail=:mail,sifre=:sifre");
        $uyeEkle=$uyeEkleSorgu->execute([
            "ad"=>$ad,
            "soyad"=>$soyad,
            "mail"=>$email,
            "sifre"=>$sifre
        ]);
        
        if($uyeEkle){
            header("Location: login.php?uye=ok");
        }else{
            header("Location: login.php?uye=var");    
        }

    }else{
        header("Location: login.php?uye=var");
    }

}

if(isset($_POST["calmalistesi"])){
    $id = $_POST["uye_id"];
    $calmalistesicek = $db->prepare("SELECT * FROM calmalistesi WHERE user_id=:id");
    $calmalistesicek->execute([":id"=>$id]);

    $listesayi= $calmalistesicek->rowCount() + 1;
    
    $olustur = $db->prepare("INSERT INTO calmalistesi SET user_id=:id,ad=:ad");
    $olustur->execute([":id"=>$id,":ad"=>"Yeni Çalma Listesi $listesayi"]);

    header("Location:index.php");

}

if(isset($_POST["calmalistesisil"])){
    $id = $_POST["id"];

    $calmalistesisil = $db->prepare("DELETE FROM calmalistesi where id=:id");
    $calmalistesisil->execute([":id"=>$id]);

    header("Location:index.php");

}


if(isset($_GET["id"]) && isset($_GET["sarki_id"])){

    $listeid = $_GET["id"];
    $sarkiid = $_GET["sarki_id"];

    $sarkiekle = $db->prepare("INSERT INTO calmalistesisarkilar set id=:liste_id,sarki_id=:sarki_id");
    $sarkiekle->execute([":liste_id"=>$listeid,":sarki_id"=>$sarkiid]);

    header("Location:calmalistesi.php?id=$listeid");


}


?>
