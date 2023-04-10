import {Vista} from './vista.js';

/**
 * Contiene la vista de los usuarios de secretaría.
 */
export class VistaSecretaria extends Vista {

    /**
	 *	Constructor de la clase.
	 *	@param {Controlador} controlador Controlador de la vista.
	 *	@param {HTMLDivElement} div Div de HTML en el que se desplegará la vista.
	 */
    constructor(controlador, div) {
        super(controlador, div);
        this.encabezado = this.div.getElementsByTagName('h3')[0];

        this.hoy = new Date();
        this.dia = this.hoy.getDate();
        this.mes = this.hoy.getMonth();
        this.anio = this.hoy.getFullYear();
        this.listaMeses = [
            "Enero", "Febrero", "Marzo",
            "Abril", "Mayo", "Junio",
            "Julio", "Agosto", "Septiembre",
            "Octubre", "Noviembre", "Diciembre"
        ];

        this.calendarioBody = document.getElementById('dias');
        this.calendarioAnio = document.getElementById('anio');
        this.calendarioMes = document.getElementById('mes');
        this.calendarioBtnNext = document.getElementById('siguiente');
        this.calendarioBtnPrev = document.getElementById('anterior');
        this.divInfo = document.getElementById('divInfo');
        this.diaSeleccionado = null;

        this.calendarioBtnNext.onclick = this.calendarioSiguiente.bind(this);
        this.calendarioBtnPrev.onclick = this.calendarioAnterior.bind(this);

        this.cargarCalendario();
    }

    /**
     * Muestra la vista si hay usuario logueado.
     * @param {Boolean} ver Mostrar / ocultar la vista.
     */
    mostrar(ver) {
        if (this.controlador.usuarioLogueado != null) {
            super.mostrar(ver);
        }
        else {
            super.mostrar(false);
        }
    }

    /**
     * Mostrar información del día seleccionado.
     * @param {Event} e Evento.
     */
    mostrarFecha(e) {
        // Desmarcar día que estaba previamente seleccionado
        this.diaSeleccionado.classList.remove('activo');

        // Marcar nuevo día seleccionado
        this.diaSeleccionado = e;
        this.diaSeleccionado.classList.add('activo');

        let anio = e.getAttribute('data-anio');
        let mes = e.getAttribute('data-mes');
        let dia = e.getAttribute('data-dia');
        
        this.divInfo.innerText = 'Información de la fecha: ' + dia + " " + this.listaMeses[mes] + " " + anio;
    }

    /**
     * Carga el calendario.
     */
    cargarCalendario() {
        // Obtiene el dia de la semana para esta fecha.
        let primerDia = new Date(this.anio, this.mes).getDay();

        // Limpiar las celdas previas.
        this.calendarioBody.innerHTML = '';

        // Comprobando el total de días en este mes para controlar el loop.
        let totalDias = this.diasEnMes(this.mes, this.anio);

        // Agregar las casillas en blanco para que la fecha comience en el día correcto de la semana
        this.fechasEnBlanco(primerDia === 0 ? 6 : primerDia - 1);

        // Añadiendo las fechas al calendario
        for (let dia=1; dia<=totalDias; dia++) {
            let celda = document.createElement('li');
            let celdaTexto = document.createTextNode(dia);

            if (this.dia === dia && this.mes === this.hoy.getMonth() && this.anio == this.hoy.getFullYear()) {
                celda.classList.add('activo');
                this.diaSeleccionado = celda;
            }

            // Añadiendo atributos
            celda.setAttribute('data-dia', dia);
            celda.setAttribute('data-mes', this.mes);
            celda.setAttribute('data-anio', this.anio);

            // Añadiendo el li al cuerpo del calendario
            celda.classList.add('singleDay');
            celda.appendChild(celdaTexto);
            celda.onclick = (e) => this.mostrarFecha(e.target);

            this.calendarioBody.appendChild(celda);
        }

        this.calendarioMes.innerHTML = this.listaMeses[this.mes];
        this.calendarioAnio.innerHTML = this.anio;
    }

    /**
     * Devuelve los días que hay en el mes actual.
     */
    diasEnMes() {
        return new Date(this.anio, this.mes + 1, 0).getDate();
    }

    /**
     * Rellena la parte del calendario que no es fecha (casillas en blanco).
     * @param {Number} count 
     */
    fechasEnBlanco(count) {
        for (let i=0; i<count; i++) {
            let celda = document.createElement('li');
            let celdaTexto = document.createTextNode('');
            celda.appendChild(celdaTexto);

            // Añadir clase 'vacia' para eliminar los bordes
            celda.classList.add('vacia');
            this.calendarioBody.appendChild(celda);
        }
    }

    /**
     * Pasa al mes siguiente.
     */
    calendarioSiguiente() {
        this.anio = this.mes === 11 ? this.anio + 1 : this.anio;
        this.mes = (this.mes + 1) % 12;
        this.cargarCalendario();
    }

    /**
     * Pasa al mes anterior.
     */
    calendarioAnterior() {
        this.anio = this.mes === 0 ? this.anio - 1 : this.anio;
        this.mes = this.mes === 0 ? 11 : this.mes - 1;
        this.cargarCalendario();
    }
}