import { VistaInicio } from "../views/padres/vistainicio.js";

/**
 * Controlador principal de los padres
 */
class ControladorPadres {
    constructor() {
        window.onload = this.iniciar.bind(this);
    }

    /**
     * Inicia la aplicación al cargar la página.
     */
    iniciar() {
        this.vistaInicio = new VistaInicio(this, document.getElementById('divInicio'));
    }

    /**
     * Lleva a la página de inicio de sesión de padres.
     */
    redireccionLogin() {
        window.location.href = '';
    }

    /**
     * Lleva a la página de registro de padres.
     */
    redireccionAlta() {
        window.location.href = './php/views/altapadres.php';
    }
}

new ControladorPadres();