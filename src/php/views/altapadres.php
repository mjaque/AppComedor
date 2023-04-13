<?php
    require_once('../controllers/controladorpadres.php');
    $controlador = new ControladorPadres();

    $resultado = $controlador->altaPadre($_POST);

    switch($resultado)
    {
        case -2:
            echo '<div class="rounded my-2 p-2 container bg-warning">Hay campos sin rellenar. Por favor revise.</div>';
            break;

        case -1:
            echo '<div class="rounded my-2 p-2 container bg-danger text-light">No hay conexión con la base de datos. Revise su conexión.</div>';
            break;

        case 0:
            break;

        case 1:
            echo '<div class="rounded my-2 p-2 container bg-success">Te has dado de alta exitosamente. Redirigiendo.</div>';
            header("Refresh: 4; url=../../index.html");
            break;

        case 1062:
            echo '<div class="rounded my-2 p-2 container bg-danger text-light">Usuario con los mismos datos ya existente.</div>';
            break;

        default:
            echo '<div class="rounded my-2 p-2 container bg-danger text-light">Error con código ' . $resultado . '</div>';
            break;
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
        <link rel="stylesheet" href="../../css/styles.css"/>
        <title>Comedor EVG</title>
    </head>
    <body>
        <form action="" method="post">
            <div class="formItem">
                <label for="nombre">
                    Nombre (*) <input type="text" class="form-control" name="nombre" maxlength="30" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="apellidos">
                    Apellidos (*) <input type="text" class="form-control" name="apellidos" maxlength="90" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="correo">
                    Dirección de email (*) <input type="email" class="form-control" name="correo" maxlength="90" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="contrasenia">
                    Contraseña (*) <input type="password" class="form-control" name="contrasenia" maxlength="90" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="telefono">
                    Nº de teléfono (*) <input type="text" class="form-control" name="telefono" maxlength="9" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="dni">
                    DNI (*) <input type="text" class="form-control" name="dni" maxlength="9" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="iban">
                    IBAN (*) <input type="text" class="form-control" name="iban" maxlength="24" required/>
                </label>
            </div>
            <div class="formItem">
                <label for="titular">
                    Titular de la cuenta (*) <input type="text" class="form-control" name="titular" maxlength="120" required/>
                </label>
            </div>
            <div class="formItem">
				<button type="reset" class="btn btn-danger"><a href="../../index.html">Cancelar</a></button>
                <button type="submit" class="btn btn-success">Registrarse</button>
            </div>
        </form>
    </body>
</html>