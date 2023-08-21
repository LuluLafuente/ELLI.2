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
    $numExamen = $_POST["num_mesa"];
    $fecha = $_POST["fecha"];
    $notas = $_POST["nota"]; //Array con las notas de alumnos que si estan
    $rinde = $_POST["rinde"]; // Array de valores "si" o "no" presentes

    // Realizar la conexión a la base de datos y ejecutar la inserción
    $host = "127.0.0.1";
    $dbNombre = "bd_prueba";
    $usuario = "isetEducativo";
    $contrasenia = "unaClaveMuyDificil1";

    try {
        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conexion = new PDO("mysql:host=$host;dbname=$dbNombre", $usuario, $contrasenia);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


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
