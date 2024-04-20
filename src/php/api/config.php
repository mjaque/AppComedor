<?php
    /**
     * Fichero de configuración
     */
    return array(
        'debug' => true,    // En modo debug se muestran los errores.
        'test' => true,     // En modo test, se permite el acceso a usuarios de test
        'log' => false,     // Indica si se genera el log de operaciones.

        // Parámetros de encriptación del login
        'algoritmo_encriptacion' => 'aes-256-ctr',
        'clave_encriptacion' => '123456789',

        // Parámetros de base de datos
        'bd' => 'appcomedor',
        'host_bd' => 'localhost',
        'usuario_bd' => 'appcomedor',
        'clave_bd' => 'appcomedor',

				// Hora límite para modificaciones
        'hora_limita' => 14
    );
?>
