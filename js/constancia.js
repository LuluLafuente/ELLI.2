document.addEventListener("DOMContentLoaded", function() {
    const contConstanciaTipo = document.getElementById('cont-constancia-tipo');
    const contCambioTexto = document.getElementById('cont-cambio-texto');

    const radioInputs = contConstanciaTipo.querySelectorAll('input[type="radio"][name="alumno-constancia"]');

    radioInputs.forEach(radio => {
        radio.addEventListener('change', function() {
            const selectedValue = this.value;
            const textDivs = contCambioTexto.querySelectorAll('.cambio-texto > div'); // Seleccionamos todos los divs dentro de cont-cambio-texto
            
            textDivs.forEach(div => {
                div.style.display = 'none'; // Ocultamos todos los divs
            });

            const selectedDiv = document.getElementById(`text-${selectedValue}`);
            if (selectedDiv) {
                selectedDiv.style.display = 'block'; // Mostramos el div seleccionado
            }
        });
    });
});


/*const container = document.getElementById('cont-cambio-texto');
const contConstanciaTipo = document.getElementById('cont-constancia-tipo');

// Agregar un evento de cambio al radio input
const radioInputs = contConstanciaTipo.querySelectorAll('input[type="radio"][name="alumno-constancia"]');
const contenidoHTML = {
    '0': `
    <h3>Certificado <span id="certificado-titulo">Alumno Regular</span></h3>

    <div id="cont-constancia-textos">
        <p>
            El Instituto Superior de Educación Tecnológica certifica que el alumno <span
                id="alumno">
                <?php echo $_SESSION["u_nombre"] . " " . $_SESSION["u_apellido"] ;?>
            </span>
            con matricula <span id="legajo">
                <?php echo $_SESSION["u_legajo"] ;?>
            </span> y dni <span id="dni">
                <?php echo $_SESSION["u_dni"] ;?>
            </span> , actualmente se encuentra en condición de regular
            en la carrera <span id="carrera">
                <?php echo $resultadoPlan[0]["CARRERA"]; ?>
            </span> con resolución <span id="resolucion">Resol. Minist. N°513/5(Med)-2014</span> habiendo ingresado en el año
            <span id="fdi-ingreso">
                <?php echo $_SESSION["u_anio"]; ?>
            </span>. <br><br>
            Se emite el presente certificado para ser presentado ante <span
                id="interesado"></span>,
            se extiende el mismo en la ciudad de San Miguel de Tucumán, a los <span
                id="fdh-dia"></span>
            días del mes de <span id="fdh-mes"></span> de <span id="fdh-anio"></span>.
        </p>
        <div id="cont-constancia-validacion">
            <h4>Código de validación</h4>
            <img src="img/imagen-certificado-2.png" alt="">
            <h4>&rarr; <span id="codigo-validacion"></span> &larr;</h4>
        </div>
        <p>
            El presente certificado puede ser validado en la pagina de la institución <span
                id="pagina-validacion"></span> ingresando el código que se detalla arriba.

            El certificado cuenta con una vigencia de <span id="dias-vigencia"></span> día/s a
            partir de la fecha de emisión del mismo.<br><br>
        </p>
        </p>
        <p>
            <strong>Observaciones</strong>:
        </p>
        <p id="observaciones"></p>
    </div>
     `,
    '1': `
    <h3>Certificado de <span id="certificado-titulo">Examen</span></h3>
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
            Materia: 
            <br>
            Fecha del examen: 
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
            Dirección: Domingo Gracia 47 (Av. Saenz Peña y Las Piedras)- S. M. de Tucumán.
            Teléfono: 3814526310.
            E-mail de consultas: correoiset@yahoo.com.ar
            URL: http://iset.tuc.infd.edu.ar
        </p>
        <p>
            <strong>Observaciones</strong>:
        </p>
        <p id="observaciones"></p>
    </div>
       
    `,
    '2': `
    <h3>Certificado <span id="certificado-titulo">Materias Aprobadas</span></h3>
    <div id="cont-constancia-textos">
        <p>
        Por medio de la presente, se certifica que <?php echo $_SESSION["u_nombre"] . " " . $_SESSION["u_apellido"] ;?>, identificado(a) 
        con <?php echo $_SESSION["u_dni"] ;?>ha aprobado satisfactoriamente las siguientes materias correspondientes al plan de estudios del Instituto Superior de Educacion Tecnologica de la <span id="carrera">
        <?php echo $resultadoPlan[0]["CARRERA"]; ?>
        
        <?php for ($i=0; $i < $consulta->rowCount(); $i++): ?>
            <?php echo "ID Materia: " . $resultado[$i]["MATERIA"] . ". Nombre: " . $resultado[$i]['ASIGNATURA'] . ".</br>" . "Nota: " . $resultado[$i]['NOTA'] . ". Condición: " . $resultado[$i]['CONDICION'] . "". Año: " . $resultado[$i]['ANIO'] . ".</br>"; ?>
        <hr>
        <?php endfor; ?>
        
        La calificación obtenida en cada una de estas materias refleja el esfuerzo y el compromiso del estudiante en su proceso de aprendizaje. Las notas han sido calculadas de acuerdo con los criterios de evaluación establecidos por la institución.
        
        Esta constancia se expide a solicitud del interesado para los fines que estime convenientes.
        
        Atentamente,
        Instituto Superior de Educacion Tecnologica
        Dirección: Domingo Gracia 47 (Av. Saenz Peña y Las Piedras)- S. M. de Tucumán.
        Teléfono: 3814526310.
        E-mail de consultas: correoiset@yahoo.com.ar
        URL: http://iset.tuc.infd.edu.ar

        </p>
        <p>
            <strong>Observaciones</strong>:
        </p>
        <p id="observaciones"></p>
    </div>
       `
};

radioInputs.forEach(radio => {
    radio.addEventListener('change', function() {
        // Obtener el valor seleccionado
        const selectedValue = this.value;

        // Insertar contenido HTML en el contenedor
        container.innerHTML = contenidoHTML[selectedValue];
    });
});*/
