<?php
    /**
     * Servicio de log.
     */class Log {
    static function registrar($usuario, $controlador, $metodo, $pathParams, $queryParams, $body) {
        $sql  = 'INSERT INTO Log (usuario, controlador, metodo, pathParams, queryParams, body) ';
        $sql .= 'VALUES (:usuario, :controlador, :metodo, :pathParams, :queryParams, :body)';

        // Verificar si $usuario no es nulo antes de obtener su propiedad email
        if ($usuario && property_exists($usuario, 'email')) {
            $usuario = $usuario->email;
        } else {
            $usuario = null;
        }

        // Convertir $pathParams y $queryParams en cadenas antes de insertar
        $pathParamsStr = is_array($pathParams) ? join('##', $pathParams) : '';
        $queryParamsStr = is_array($queryParams) ? join('##', $queryParams) : '';

        // Convertir $body en JSON antes de insertar
        $bodyJson = json_encode($body);

        $params = array(
            'usuario' => $usuario,
            'controlador' => $controlador, 
            'metodo' => $metodo, 
            'pathParams' => $pathParamsStr, 
            'queryParams' => $queryParamsStr,
            'body' => $bodyJson
        ); 

        BD::insertar($sql, $params);
    }
}

?>