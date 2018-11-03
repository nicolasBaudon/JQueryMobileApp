<?php
require_once '../Persistencia/ControladorPersistencia.php';
require_once '../Persistencia/DbSentencias.php';

abstract class controladorGeneral {
    protected $refControladorPersistencia;
    
    function __construct() {
        $this->refControladorPersistencia = ControladorPersistencia::obtenerCP();
    }
    
    public abstract function listar($datos);
};

