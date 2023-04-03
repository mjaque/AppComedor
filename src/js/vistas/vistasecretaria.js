/**
 * Contiene la vista de los usuarios de secretaría.
 */
import {Vista} from './vista.js';

export class VistaSecretaria extends Vista {

    /**
	 *	Constructor de la clase.
	 *	@param {Controlador} controlador Controlador de la vista.
	 *	@param {HTMLDivElement} div Div de HTML en el que se desplegará la vista.
	 */
    constructor(controlador, div) {
        super(controlador, div);
        this.encabezado = this.div.getElementsByTagName('h3')[0];
    }
}