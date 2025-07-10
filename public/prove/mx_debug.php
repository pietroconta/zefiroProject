<?php

// USO:
//   m_debug('a_debug_'.pathinfo(__FILE__, PATHINFO_FILENAME).'_2'.'.txt', $s);

  function m_debug($file, $SQL) {
    ob_start();
    //print_r($_SERVER);
    print_r($_REQUEST);
    $out = ob_get_contents();
    ob_end_clean();
    $fp  = fopen($file, 'w');
    fwrite($fp, $out);
    fwrite($fp, $SQL);
    fclose($fp);
    return 0;
  }

  function Strip($value) {
    if (get_magic_quotes_gpc() != 0) {
      if (is_array($value))
        if (array_is_associative($value)) {
          foreach ($value as $k => $v)
            $tmp_val[$k] = stripslashes($v);
          $value       = $tmp_val;
        } else
          for ($j = 0; $j < sizeof($value); $j++)
            $value[$j] = stripslashes($value[$j]);
      else
        $value     = stripslashes($value);
    }
    return $value;
  }

  function array_is_associative($array) {
    if (is_array($array) && !empty($array)) {
      for ($iterator = count($array) - 1; $iterator; $iterator--) {
        if (!array_key_exists($iterator, $array)) {
          return true;
        }
      }
      return !array_key_exists(0, $array);
    }
    return false;
  }

?>
