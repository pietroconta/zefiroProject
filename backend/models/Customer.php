<?php
class Customer{
    private $pdo;
    public function __construct($pdo){
        $this->pdo = $pdo;
    }

    public function get($id = null) {
        if ($id) {
            $stmt = $this->pdo->prepare("SELECT * FROM clienti WHERE id = ?");
            $stmt->execute([$id]);
        } else {
            $stmt = $this->pdo->query("SELECT * FROM clienti");
        }
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insert($nome, $cognome, $indirizzo, $localita, $cap, $prov) {
        $stmt = $this->pdo->prepare("INSERT INTO clienti (nome, cognome, indirizzo, localita, cap, prov) VALUES (?, ?, ?, ?, ?, ?)");
        return $stmt->execute([$nome, $cognome, $indirizzo, $localita, $cap, $prov]);
    }

    public function delete($id) {
        $stmt = $this->pdo->prepare("DELETE FROM clienti WHERE id_cliente = ?");
        return $stmt->execute([$id]);
    }

    public function put($id, $nome, $cognome) {
        $stmt = $this->pdo->prepare("UPDATE clienti SET nome = ?, cognome = ? WHERE id_cliente = ?");
        return $stmt->execute([$nome, $cognome, $id]);

    }

}