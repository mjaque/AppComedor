<?php
    require_once(dirname(__DIR__) . '/daos/daousuario.php');
    require_once(dirname(__DIR__) . '/daos/daofestivos.php');

    /**
     * Controlador de hijos.
     */
    class Dias {
        /**
         * Obtener filas de la tabla dias.
         * @param array $pathParams No utilizado.
         * @param array $queryParams Array de IDs.
         * @param object $usuario Usuario que realiza el proceso.
         */
        function get($pathParams, $queryParams, $usuario) {
            // Si no existe $usuario, es porque la autorización ha fallado.
            if (!$usuario) {
                header('HTTP/1.1 401 Unauthorized');
                die();
            }

            if (count($queryParams)) {
                $resultado = DAOUsuario::obtenerDias($queryParams);

                header('Content-type: application/json; charset=utf-8');
                header('HTTP/1.1 200 OK');
                echo(json_encode($resultado));
                die();
            }
            else {
                header('HTTP/1.1 400 Bad Request');
                die();
            }
        }

        /**
         * Inserta fila a la tabla dias.
         * @param array $pathParams No utilizado.
         * @param array $queryParams No utilizado.
         * @param object $datos Datos del usuario.
         * @param object $usuario Usuario que realiza el proceso.
         */
        function post($pathParams, $queryParams, $datos, $usuario) {
            // Si no existe $usuario, es porque la autorización ha fallado.
            if (!$usuario) {
                header('HTTP/1.1 401 Unauthorized');
                die();
            }
        
            // Verificar si la fecha enviada es menor que la fecha actual
            $fechaActual = date('Y-m-d');
            if ($datos->dia < $fechaActual) {
                header('HTTP/1.1 400 Bad Request');
                echo json_encode(array("error" => "La fecha enviada es menor que la fecha actual"));
                die();
            }
        
            // Es fin de semana
            $diaSemana = date('w', strtotime($datos->dia));
            if ($diaSemana == 0 || $diaSemana == 6) {
                // Abortamos sin error
                header('HTTP/1.1 200 OK');
                die();
            }
        
            // ¿Es festivo?
            if (DAOFestivos::esFestivo($datos->dia)) {
                // Abortamos sin error
                header('HTTP/1.1 200 OK');
                die();
            }
        
            // Si todo está correcto, procedemos a insertar el día
            DAOUsuario::altaDia($datos);
            header('HTTP/1.1 200 OK');
            die();
        }
        

        /**
         * Borrar fila de la tabla dias
         * @param array $pathParams Datos del día.
         * @param array $queryParams No utilizado.
         * @param object $usuario Usuario que realiza el proceso.
         */
        function delete($pathParams, $queryParams, $usuario) {
            // Si no existe $usuario, es porque la autorización ha fallado.
            if (!$usuario) {
                header('HTTP/1.1 401 Unauthorized');
                die();
            }
        
            if (count($pathParams)) {
                $fecha = new DateTime($pathParams[0]);
                $fecha = $fecha->format('Y-m-d');
        
                // Verificar si la fecha enviada es menor que la fecha actual
                $fechaActual = date('Y-m-d');
                if ($fecha < $fechaActual) {
                    header('HTTP/1.1 400 Bad Request');
                    echo json_encode(array("error" => "La fecha enviada es menor que la fecha actual"));
                    die();
                }
        
                DAOUsuario::eliminarDia($fecha, $pathParams[1], $pathParams[2]);
        
                header('HTTP/1.1 200 OK');
                die();
            }
            else {
                header('HTTP/1.1 400 Bad Request');
                die();
            }
        }
        
    }
?>
