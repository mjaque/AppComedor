import {Vista} from '../vista.js';

/**
 * Contiene la vista del inicio de sesión de Google
 */
export class VistaLoginGoogle extends Vista {

    /**
	 *	Constructor de la clase.
	 *	@param {Controlador} controlador Controlador de la vista.
	 *	@param {HTMLDivElement} div Div de HTML en el que se desplegará la vista.
	 */
    constructor(controlador, div) {
        super(controlador, div);
        this.habilitarLogin();
    }

    /**
     * Activa el login de Google.
     */
    habilitarLogin(){
		google.accounts.id.initialize({
            client_id: "756573648994-cn4uk8gsic003hnotjb9mpt1mjtnqvgm.apps.googleusercontent.com",
            callback: this.controlador.loginGoogle.bind(this.controlador)
        });

        google.accounts.id.renderButton(
            document.getElementById('divGoogleLogin'),
            { theme: "outline", size: "large", text: "signin_with", shape: "rectangular" }
        );
	}
}