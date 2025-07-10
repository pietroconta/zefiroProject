<?php
define('BASE_PATH', __DIR__);
require_once 'db/db_connect.php';
require_once 'controllers/CustomerController.php';
//require_once 'controllers/OrderController.php';

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);  // es: /backend/api.php/customers
$script_name = $_SERVER['SCRIPT_NAME'];                    // es: /backend/api.php
$method = $_SERVER['REQUEST_METHOD'];

// Prendo la parte di URI che segue api.php
$path = substr($uri, strlen($script_name));  // es: /customers oppure /orders

if ($path === '' || $path === '/') {
    // opzione: magari lista risorse di default o errore
    http_response_code(400);
    echo "Nessun endpoint specificato";
    exit;
}

//inizio routing

if (preg_match('#^/customers/?$#', $path)) {
    $controller = new CustomerController($pdo);
    switch ($method) {
        case 'GET':
            $id = $_GET['id'] ?? null;
            $controller->select($id);
            break;
        case 'PUT':
            if($controller->put()){
                http_response_code(200);
            }
                break;
        case 'POST':
            $controller->insert();
            break;
        case 'DELETE':
            $controller->delete();
            break;
        default:
            http_response_code(405);
            echo "Metodo non supportato";
    }
}
/*elseif (preg_match('#^/orders/?$#', $path)) {
    $controller = new OrderController($conn);
    switch ($method) {
        case 'GET':
            // Implementa get ordini
            break;
        case 'POST':
            // Implementa insert ordine
            break;
        // altri metodi...
        default:
            http_response_code(405);
            echo "Metodo non supportato";
    }
}*/
else {
    http_response_code(404);
    echo "Endpoint non trovato";
}
