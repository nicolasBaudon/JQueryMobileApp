<?php

require 'controladorGeneral.php';

class controladorPais extends controladorGeneral {
    
    function __construct() {
        parent::__construct();
    }

    public function listar($datos) {
        try {
            $this->refControladorPersistencia->iniciarTransaccion();
            $resulatdo = $this->refControladorPersistencia->ejecutarSentencia(DbSentencias::LISTAR_PAIS);
            $pais = $resulatdo->fetchAll(PDO::FETCH_ASSOC);
            $this->refControladorPersistencia->confirmarTransaccion();
            return $pais;
        } catch (Exception $e) {
            echo 'Error: ' .$e->getMessage();
        }
    }

};
