<?php

require 'controladorGeneral.php';

class controladorVuelo extends controladorGeneral {
    
    function __construct() {
        parent::__construct();
    }

    public function listar($datos) {
        try {
            $this->refControladorPersistencia->iniciarTransaccion();
            $parametros = array("fk_Pais" => $datos['id']);
            $resultado = $this->refControladorPersistencia->ejecutarSentencia(DbSentencias::LISTAR_VUELO, $parametros);
            $vuelo= $resultado->fetchAll(PDO::FETCH_ASSOC);
            $this->refControladorPersistencia->confirmarTransaccion();
            return $vuelo;
        } catch (Exception $e){
             echo 'Error: ' .$e->getMessage();
        }
    }

}