<?php
//INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include_once 'bd_conexion.php';
include_once 'bd_select.php';

//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    ///header("location:index.php");
    //exit;
}

// Verifica si se enviaron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $materiaId = $_POST["materia"];
    $tipoNota = $_POST["tipoNota"];

    // Datos de los alumnos y sus notas
    $legajos = $_POST["legajo"];
    $notas = $_POST["nota"];
   
    // Aquí puedes realizar la conexión a la base de datos con tus credenciales
    
    try {
        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conn = conexionDB();
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Utilizamos transacciones para asegurar que todas las actualizaciones se realicen correctamente
        $conn->beginTransaction();

        // Iterar sobre los datos de los alumnos y sus notas y guardarlos en la base de datos
        foreach ($legajos as $legajo) {
            // Verificar si la nota está definida antes de guardarla en la base de datos
           if (isset($notas[$legajo]) && !empty($notas[$legajo])) {
                $nota = $notas[$legajo];

                // Verificar el tipo de parcial y construir la consulta SQL adecuada
                if ($tipoNota == "1ER_PARCIAL") {
                    $sql = "UPDATE cursa SET 1ER_PARCIAL =:nota WHERE ID_MATERIA =:materia AND ID_ALUMNO =:legajo";
                } elseif ($tipoNota == "2DO_PARCIAL") {
                    $sql = "UPDATE cursa SET 2DO_PARCIAL =:nota WHERE ID_MATERIA =:materia AND ID_ALUMNO =:legajo";
                } else {
                    // Manejo de error si no se seleccionó ningún tipo de parcial
                    echo "Error: Debes seleccionar un tipo de parcial.";
                    exit;
                }

                // Prepara la consulta SQL para actualizar los datos en la tabla utilizando consultas preparadas
                $stmt = $conn->prepare($sql);
                // Asigna los valores a los parámetros de la consulta preparada
                $stmt->bindParam(':legajo', $legajo, PDO::PARAM_STR);
                $stmt->bindParam(':materia', $materiaId, PDO::PARAM_INT);
                $stmt->bindParam(':nota', $nota, PDO::PARAM_INT);

                // Ejecuta la consulta
                $stmt->execute();
            }
        }

        // Confirmamos la transacción si todas las actualizaciones fueron exitosas
        $conn->commit();

        $message = "Notas registradas con éxito.";
        echo "<script>alert('$message');</script>";

    } catch (PDOException $e) {
        // Si ocurre un error, deshacemos la transacción y mostramos el mensaje de error
        $conn->rollback();
        echo "Error en la consulta: " . $e->getMessage();
    }
    
    // Cierra la conexión
    $conn = null;
}

header("location:examen_parcial.php");
?>