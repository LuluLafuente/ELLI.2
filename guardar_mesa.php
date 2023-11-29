<?php
//INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include_once 'bd_conexion.php';
include_once 'bd_select.php';

if (!isset($_SESSION["usuario"])) {
    //header("location:index.php");
    //exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $carrera = $_POST["carrera"];
    $materia = $_POST["materia"];
    $mesa = $_POST["mesa"];
    $libro = $_POST["libro"];
    $folio = $_POST["folio"];
    $fecha = $_POST["fecha"];
    $rinde = $_POST["rinde"]; //si o no rinde
    $legajos = $_POST["legajo"];
    $nota = 0;


    try {
        $conexion = conexionDB();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conexion->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $conexion->beginTransaction();

        $sqlExamen = "INSERT INTO examen_final (ID_EXAMEN_FINAL, ID_MATERIA, LIBRO, FOLIO, FECHA) VALUES (:mesa, :materia, :libro, :folio, :fecha)";
        $stmtExamen = $conexion->prepare($sqlExamen);
        $stmtExamen->bindParam(":mesa", $mesa);
        $stmtExamen->bindParam(":materia", $materia);
        $stmtExamen->bindParam(":libro", $libro);
        $stmtExamen->bindParam(":folio", $folio);
        $stmtExamen->bindParam(":fecha", $fecha);
        $stmtExamen->execute();
        $examenId = $conexion->lastInsertId();

        foreach ($rinde as $legajo => $valor) {
            if ($valor == "si") {
                $sqlAlumno = "INSERT INTO rinde (ID_EXAMEN, ID_ALUMNO, ID_MATERIA, NOTA, FECHA) VALUES (:examenId, :legajo, :materia, :nota, :fecha)";
                $stmtAlumno = $conexion->prepare($sqlAlumno);
                $stmtAlumno->bindParam(":examenId", $examenId);
                $stmtAlumno->bindParam(":legajo", $legajo);
                $stmtAlumno->bindParam(":materia", $materia);
                $stmtAlumno->bindParam(":nota", $nota);
                $stmtAlumno->bindParam(":fecha", $fecha);
                $stmtAlumno->execute();
            }
        }
  // Confirmamos la transacción si todas las actualizaciones fueron exitosas
            $conexion->commit();

            $message = "Notas registradas con éxito.";
            echo "<script>alert('$message');</script>";

        } catch (PDOException $e) {
                // Si ocurre un error, deshacemos la transacción y mostramos el mensaje de error
                $conexion->rollback();
                echo "Error en la consulta: " . $e->getMessage();
            }

            // Cierra la conexión
    $conexion = null;
}
header("location:crear_mesa.php");
?>
