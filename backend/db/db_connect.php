<?php
if (!defined('EOL')) {
  define("EOL", $is_web = http_response_code() !== FALSE ? "<br/>" : PHP_EOL);
}

/* Database connection start */
$type       = "mysql";
$servername = "localhost";
$username   = "root";
$password   = "psw";
$dbname     = "_fullstack06";

try {
  //echo 1;
  $pdo = new PDO("$type:host=$servername;dbname=$dbname", $username, $password);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  //echo 2;
  echo "Errore connessione:" . $e->getMessage();
}


