<?php
//INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include_once 'bd_conexion.php';
include_once 'bd_select.php';

if(!isset($_SESSION["usuario"])){
    //header("location:index.php");
    //exit;
}

// Verificar si se recibieron los datos necesarios
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $materia = $_POST["materia"];
    $numExamen = $_POST["num_mesa"];
    $fecha = $_POST["fecha"];
    $notas = $_POST["nota"]; //Array con las notas de alumnos que si estan
    $rinde = $_POST["rinde"]; // Array de valores "si" o "no" presentes

    

    try {
        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conexion = conexionDB();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Utilizamos transacciones para asegurar que todas las actualizaciones se realicen correctamente
        $conexion->beginTransaction();
        // Insertar las notas de los alumnos en la tabla de notas de examen si rinde = "si"
        foreach ($rinde as $legajo => $respuesta) {
            if ($respuesta === "si" && isset($notas[$legajo])) {
                $nota = intval($notas[$legajo]);
                $sqlNota = "UPDATE rinde SET NOTA = :nota WHERE ID_EXAMEN = :numExamen AND ID_ALUMNO = :legajo";
                $stmtNota = $conexion->prepare($sqlNota);
                $stmtNota->bindParam(":nota", $nota);
                $stmtNota->bindParam(":numExamen", $numExamen);
                $stmtNota->bindParam(":legajo", $legajo);
                $stmtNota->execute();
                
            }
            else{
                $sqlAusente = "DELETE FROM rinde WHERE ID_ALUMNO= :legajo AND ID_EXAMEN = :numExamen";
                $stmtAusente = $conexion->prepare($sqlAusente);
                $stmtAusente->bindParam(":numExamen", $numExamen);
                $stmtAusente->bindParam(":legajo", $legajo);
                $stmtAusente->execute();
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
header("location:examen_final.php");
?>
