<?php

interface DbSentencias {
    
//PAIS
    const LISTAR_PAIS = "SELECT `pais`.* FROM `progavanzadaseleccion`.`pais`;";
//PROVINCIA
    const LISTAR_PROVINCIA = "SELECT `provincia`.* FROM `progavanzadaseleccion`.`provincia` WHERE fk_Pais = ?;";
//LOCALIDAD
    const LISTAR_LOCALIDAD = "SELECT `localidad`.* FROM `progavanzadaseleccion`.`localidad` WHERE fk_Provincia = ?;";
//VUELO
    const LISTAR_VUELO = "SELECT `vuelo`.* FROM `progavanzadaseleccion`.`vuelo` WHERE fk_Pais = ?;";
}
