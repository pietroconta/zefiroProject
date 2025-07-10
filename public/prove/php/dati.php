<?php
  $data = array(
    array("id"=>1, "nome"=>"Marco"    , "cognome"=>'Rossi'),
    array("id"=>2, "nome"=>"Angelo"   , "cognome"=>'Di Vittorio'),
    array("id"=>3, "nome"=>"Franco"   , "cognome"=>'De Angelis'),
    array("id"=>4, "nome"=>"Gigliola" , "cognome"=>'Fiorentini'),
    array("id"=>5, "nome"=>"Anna"     , "cognome"=>'Mastrangelo'),
    array("id"=>6, "nome"=>"Franco"   , "cognome"=>'Bianchi')
  );

  header('Content-Type: application/json'); // Imposta l'intestazione corretta
  echo json_encode($data);                  // Codifica l'array in JSON e lo invia
?>