import {VistaLoginGoogle} from '../vistas/vistalogingoogle.js';
import {VistaSecretaria} from '../vistas/vistasecretaria.js';

/**
 * Controlador principal de la aplicación
 */
class ControladorComedor {
    constructor() {
        window.onload = this.iniciar.bind(this);
    }

    /**
     * Inicia la aplicación al cargar la página.
     */
    iniciar() {
        this.usuarioLogueado = null;
        this.vistaLoginGoogle = new VistaLoginGoogle(this, document.getElementById('divLoginGoogle'));
        this.vistaSecretaria = new VistaSecretaria(this, document.getElementById('divSecretaria'));
        
        this.vistaLoginGoogle.mostrar(true);
        this.vistaSecretaria.mostrar(false);
    }

    /**
     * Obtiene los datos del usuario que inicia sesión.
     * @param {Object} respuesta Token del inicio de sesión.
     */
    loginGoogle(respuesta) {
        const respuestaPayload = this.decodificarRespuestaJwt(respuesta.credential);
        this.usuarioLogueado = respuestaPayload;

        /*console.log("ID: " + respuestaPayload.sub);
        console.log("Nombre y apellidos: " + respuestaPayload.name);
        console.log("Nombre: " + respuestaPayload.given_name);
        console.log("Nombre de familia: " + respuestaPayload.family_name);
        console.log("Imagen URL: " + respuestaPayload.picture);
        console.log("Email: " + respuestaPayload.email);*/
 
        this.vistaSecretaria.encabezado.innerText = 'Bienvenid@ ' + respuestaPayload.given_name;
        
        this.vistaLoginGoogle.mostrar(false);
        this.vistaSecretaria.mostrar(true);
    }

    /**
     * Decodifica el token en Base64 y lo parsea de vuelta a un objeto de tipo JSON.
     * @param {Object} token 
     */
    decodificarRespuestaJwt(token) {
        let base64Url = token.split(".")[1];
        let base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
        let jsonPayload = decodeURIComponent(
          atob(base64)
            .split("")
            .map(function (c) {
              return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
            })
            .join("")
        );

        return JSON.parse(jsonPayload);
    }
}

new ControladorComedor();