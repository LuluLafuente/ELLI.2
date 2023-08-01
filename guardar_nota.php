<?php

// Verifica si se enviaron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $legajo = $_POST["alumno"];
    $materia = $_POST["materia"];
    $nota = $_POST["nota"];
    $acta = $_POST["acta"];

    // Conexión a la base de datos
    $host = "127.0.0.1";
    $dbNombre = "bd_prueba";
    $usuario = "isetEducativo";
    $contrasenia = "unaClaveMuyDificil1";

    // Crea la conexión
    $conn = new PDO("mysql:host = $host; dbname=$dbNombre", "$usuario", "$contrasenia");

    // Verifica si la conexión es exitosa
    if ($conn->connect_error) {
        die("Error en la conexión: " . $conn->connect_error);
    }

    // Prepara la consulta SQL para insertar los datos en la tabla
    $sql = "INSERT INTO examenfinal (ID_ALUMNO, MATERIA, FINAL, ID_ACTA) VALUES ('$legajo','$materia','$nota', '$acta')";

    // Ejecuta la consulta
    if ($conn->query($sql) === TRUE) {
        echo "Nota registrada con éxito.";
    } else {
        echo "Error al registrar la nota: " . $conn->error;
    }

    // Cierra la conexión
    $conn->close();
}
?>
