<?php
    /**
     * Fichero de configuración
     */
    define("HORALIMITE",14);
    return array(
        'debug' => true,    // En modo debug se muestran los errores.
        'test' => false,     // En modo test, se permite el acceso a usuarios de test
        'log' => true,     // Indica si se genera el log de operaciones.

        // Parámetros de encriptación del login
        'algoritmo_encriptacion' => 'aes-256-ctr',
        'clave_encriptacion' => '123456789',

        // Parámetros de base de datos
        'bd' => 'appcomedor',
        'host_bd' => 'localhost',
        'usuario_bd' => 'root',
        'clave_bd' => ''
    );
?>
