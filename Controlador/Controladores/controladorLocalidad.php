<?php

require 'controladorGeneral.php';

class controladorLocalidad extends controladorGeneral {
    
    function __construct() {
        parent::__construct();
    }

    public function listar($datos) {
        try {
            $this->refControladorPersistencia->iniciarTransaccion();
            $parametros = array("fk_Provincia" => $datos['id']);
            $resultado = $this->refControladorPersistencia->ejecutarSentencia(DbSentencias::LISTAR_LOCALIDAD, $parametros);
            $localidad = $resultado->fetchAll(PDO::FETCH_ASSOC);
            $this->refControladorPersistencia->confirmarTransaccion();
            return $localidad;
        } catch (Exception $e) {
            echo 'Error: ' .$e->getMessage();
        }
    }

};


