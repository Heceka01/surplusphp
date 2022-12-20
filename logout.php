<?php
session_start();
ob_start();
session_destroy();
ob_clean();

header("Location:login.php");
?>