<?php

//INICIO SESION
session_start();

if(!isset($_SESSION["usuario"])){
    //header("location:index.php");
    //exit;
}
// Verificar si se recibieron los datos necesarios
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $materia = $_POST["materia"];
    $numExamen = $_POST["num_examen"];
    $numLibro = $_POST["num_libro"];
    $folio = $_POST["folio"];
    $fecha = $_POST["fecha"];
    $notas = $_POST["nota"];

    // Realizar la conexión a la base de datos y ejecutar la inserción
     $host = "127.0.0.1";
    $dbNombre = "bd_prueba";
    $usuario = "isetEducativo";
    $contrasenia = "unaClaveMuyDificil1";

    try {
        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conexion = new PDO("mysql:host=$host;dbname=$dbNombre", $usuario, $contrasenia);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Insertar los datos en la tabla correspondiente
        $sql = "INSERT INTO examen_final (ID_EXAMEN_FINAL, ID_MATERIA, LIBRO, FOLIO, FECHA) VALUES (:numExamen, :materia,  :numLibro, :folio, :fecha)";
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(":numExamen", $numExamen);
        $stmt->bindParam(":materia", $materia);
        $stmt->bindParam(":numLibro", $numLibro);
        $stmt->bindParam(":folio", $folio);
        $stmt->bindParam(":fecha", $fecha);
        $stmt->execute();

        // Insertar las notas de los alumnos en la tabla de notas de examen
        foreach ($notas as $legajo => $nota) {
            $sqlNota = "INSERT INTO rinde (ID_EXAMEN, ID_ALUMNO, ID_MATERIA, NOTA, FECHA) VALUES (:numExamen, :legajo, :materia, :nota, :fecha)";
            $stmtNota = $conexion->prepare($sqlNota);
            $stmtNota->bindParam(":numExamen", $numExamen);
            $stmtNota->bindParam(":legajo", $legajo);
            $stmtNota->bindParam(":materia", $materia);
            $stmtNota->bindParam(":nota", $nota);
            $stmtNota->bindParam(":fecha", $fecha);
            $stmtNota->execute();
        }

        // Cerrar la conexión
        $conexion = null;

        echo "Notas guardadas exitosamente.";
    } catch (PDOException $e) {
        echo "Error al guardar las notas: " . $e->getMessage();
    }
} else {
    echo "Acceso no autorizado.";
}
header("location:examen_final.php");
?>