<?php

include_once("../_db_connect.php");
include_once("../mx_debug.php");
// m_debug('a_debug_'.pathinfo(__FILE__, PATHINFO_FILENAME).'_'.__FUNCTION__. '_2'.'.txt', '');

$id_op = $_POST['operation'];
$id_req_pag = $_POST['id_req_pag'];
$id_rows_pag = $_POST['id_rows_pag'];

$params = array();
$params['id_req_pag'] = $id_req_pag;
$params['id_rows_pag'] = $id_rows_pag;

function imposta_qry_base()
{
  $term = ";";
  $sql_b = "select id_cliente, nome, cognome, indirizzo, localita, cap, prov from clienti";
  $where = " where 1";
  $sql = $sql_b . $where; // . $term;  !!!! no punto e virgola
  return $sql;
}

function calc_tot_pags($params)
{
  $tot_num_pags = 0;
  return $tot_num_pags;
}

function imposta_qry_p($sql_base, $params)
{
  $db_num_rows  = $params['db_num_rows'];
  $id_req_pag   = $params['id_req_pag'];
  $id_rows_pag  = $params['id_rows_pag'];

  if ($id_req_pag > 1) {
    $start = (int)(($id_rows_pag + $id_req_pag - 1) / $id_req_pag);
  } else {
    $start = 0;
  }
  $start = ($id_req_pag * $id_rows_pag) - $id_rows_pag;

  $arr_pars = array();
  $arr_pars['db_num_rows'] = $db_num_rows;
  $arr_pars['limit'] = $id_rows_pag;
  $arr_pars['id_req_pag'] = $id_req_pag;

  $term = ";";
  $sql_p = $sql_base;

  $limiti = sprintf(" limit %d offset %d", $id_rows_pag, $start);

  $sql = $sql_p . $limiti . $term;

  return $sql;
}

function leggi_clienti($conn, $params)
{
  try {
    $data = [];

    // conta numero totale records
    $sql = imposta_qry_base();
    $sql_base = $sql;

    $rs = $conn->prepare($sql_base);
    $rs->execute();


    $db_num_rows = $rs->rowCount();
    $params['db_num_rows'] = $db_num_rows;
    $params['tot_recs'] = calc_tot_pags($params);

    // imposta limiti su query
    $qry = imposta_qry_p($sql_base, $params);

    $rs = $conn->prepare($qry);
    $rs->execute();

    if ($rs->rowCount() > 0) {
      while ($row = $rs->fetch(PDO::FETCH_ASSOC)) {
        $tmp = array();
        $tmp['id_cliente']  = $row['id_cliente'];
        $tmp['nome']        = $row['nome'];
        $tmp['cognome']     = $row['cognome'];
        // $tmp['indirizzo']   = $row['indirizzo'];
        // $tmp['localita']    = $row['localita'];
        // $tmp['cap']         = $row['cap'];
        // $tmp['prov']        = $row['prov'];zz
        array_push($data, $tmp);
      }
      $ret_arrays = array();
      $ret_arrays['ret_par'] = $params;
      $ret_arrays['dati_db'] = $data;
      // $ret_arrays = $data;
      return $ret_arrays;
    } else {
      $ret_arrays = array_merge($data, $data);
      return $ret_arrays;
    }
  } catch (PDOException $e) {
    echo "error  " . $e->getMessage();
  }
  echo ($data);
}

$data2 = leggi_clienti($conn, $params);
header('Content-Type: application/json');
echo json_encode($data2);
