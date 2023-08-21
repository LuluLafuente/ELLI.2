const container = document.getElementById('cont-cambio-texto');
const contConstanciaTipo = document.getElementById('cont-constancia-tipo');

// Agregar un evento de cambio al radio input
const radioInputs = contConstanciaTipo.querySelectorAll('input[type="radio"][name="alumno-constancia"]');
const contenidoHTML = {
    '0': `
   
    <h3>Certificado <span id="certificado-titulo">Alumno Regular</span></h3>

<div id="cont-constancia-textos">
    <p>
        Por la presente, se hace constar que el(la) estudiante <span id="alumno">
            <?php echo $_SESSION["u_nombre"] . " " . $_SESSION["u_apellido"] ;?>
        </span>
        con numero de matricula <span id="legajo">
            <?php echo $_SESSION["u_legajo"] ;?>
        </span> y dni <span id="dni">
            <?php echo $_SESSION["u_dni"] ;?>
        </span> perteneciente a la carrera de <span id="carrera">
            <?php echo $resultadoPlan[0]["CARRERA"]; ?>
        </span> ha sido otorgado(a) el permiso para presentar el siguiente examen con resolución
        <span id="resolucion">Resol. Minist. N°513/5(Med)-2014</span>
        <br>
        Materia: [Nombre de la materia]
        <br>
        Fecha del examen: [Fecha del examen]
        <br>
        Horario: 19 a 22 hs


    <div id="cont-constancia-validacion">
        <h4>Código de validación</h4>
        <img src="img/imagen-certificado-2.png" alt="">
        <h4>&rarr; <span id="codigo-validacion"></span> &larr;</h4>
    </div>
    <p>
        Este permiso ha sido otorgado de acuerdo con las regulaciones y procedimientos
        establecidos por la institución, y el estudiante ha cumplido con los requisitos
        necesarios para la presentación del examen en cuestión.

        Se recuerda al estudiante la importancia de llegar puntualmente al lugar del examen y de
        cumplir con las normas de conducta y ética durante el proceso de evaluación.

        El certificado cuenta con una vigencia de <span id="dias-vigencia"></span> día/s a
        partir de la fecha de emisión del mismo.<br><br>
        Esta constancia se emite a solicitud del interesado para los fines que considere
        pertinentes.
        Atentamente,


        Instituto Superior de Educacion Tecnologica
        [Teléfono de contacto]
        [Correo electrónico de contacto]

    </p>
    <p>
        <strong>Observaciones</strong>:
    </p>
    <p id="observaciones"></p>
</div>
    `,
    '1': `
        <h2>Contenido para Examen</h2>
        <!-- ... Puedes agregar más contenido aquí ... -->
    `,
    '2': `
        <h2>Contenido para Materias Aprobadas</h2>
        <!-- ... Puedes agregar más contenido aquí ... -->
    `
};

radioInputs.forEach(radio => {
    radio.addEventListener('change', function() {
        // Obtener el valor seleccionado
        const selectedValue = this.value;

        // Insertar contenido HTML en el contenedor
        container.innerHTML = contenidoHTML[selectedValue];
    });
});
