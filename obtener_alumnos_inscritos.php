<?php
//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if (!isset($_SESSION["usuario"])) {
    //header("location:index.html");
    //echo "Verdadero </br>";
}

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();

// Verificar si se recibió el valor de materiaId por POST
if (isset($_POST['materiaId'])) {
    $materiaId = $_POST['materiaId'];
    
    // Realizar la consulta para obtener los alumnos inscritos en la materia seleccionada
    $alumnos = selectAlumnosPorMateria($conexion, $materiaId);

    // Generar las opciones del select de alumnos
    echo '<option value="0" selected disabled>&gt; SELECCIONE UN ALUMNO &lt;</option>';
    foreach ($alumnos as $alumno) {
        $alumnoId = $alumno['id_alumno'];
        $alumnoNombre = $alumno['nombre_alumno'];
        echo '<option value="' . $alumnoId . '">' . $alumnoNombre . '</option>';
    }
}
