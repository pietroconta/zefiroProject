<?php
require_once BASE_PATH . '/models/Customer.php';
class CustomerController {
    private $model;

    public function __construct($pdo) {
        $this->model = new Customer($pdo);
    }

    public function select($id = null) {
        $result = $this->model->get($id);
        echo json_encode($result);
    }

    public function insert() {
        $data = json_decode(file_get_contents("php://input"), true);
    
        // Controllo che tutti i campi siano presenti
        if (!isset($data['nome'], $data['cognome'], $data['indirizzo'], $data['localita'], $data['cap'], $data['prov'])) {
            http_response_code(400);
            echo "Dati mancanti";
            return;
        }
    
        // Passo tutti i parametri al model
        $success = $this->model->insert(
            $data['nome'], 
            $data['cognome'], 
            $data['indirizzo'], 
            $data['localita'], 
            $data['cap'], 
            $data['prov']
        );
    
        return $success ? true : false;
    }

    public function put() {
        $data = json_decode(file_get_contents("php://input"), true);
        if (isset($data['nome']) && isset($data['cognome']) && isset($data['id'])) {
            $success = $this->model->put(
                $data['id'],
                $data['nome'], 
                $data['cognome']
            );
            return $success ? true : false;
        }else{
            http_response_code(400);
            return;
        }
    }

    public function delete() {
        $data = json_decode(file_get_contents("php://input"), true);
        if (!isset($data['id'])) {
            http_response_code(400);
            echo "ID mancante";
            return;
        }
        $success = $this->model->delete($data['id']);
        echo $success ? "Eliminato" : "Errore";
    }
}