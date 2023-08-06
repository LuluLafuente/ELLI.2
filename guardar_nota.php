<?php
// Verifica si se enviaron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $legajo = $_POST["alumno"];
    $materia = $_POST["materia"];
    $nota = $_POST["nota"];
    $acta = $_POST["acta"];

    // Aquí puedes realizar la conexión a la base de datos con tus credenciales
    $host = "127.0.0.1";
        $dbNombre = "bd_prueba";
        $usuario = "isetEducativo";
        $contrasenia = "unaClaveMuyDificil1";

        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conn = new PDO("mysql:host = $host; dbname=$dbNombre", "$usuario", "$contrasenia");

    // Verifica si la conexión es exitosa
    if (!$conn) {
        die("Error en la conexión: " . print_r($conn->errorInfo(), true));
    }

    try {
        // Prepara la consulta SQL para insertar los datos en la tabla utilizando consultas preparadas
    $sql = "UPDATE examen_final SET FINAL=:nota, ID_ACTA=:acta Where ID_MATERIA = :materia AND ID_ALUMNO = :legajo; ";
    $stmt = $conn->prepare($sql);

    // Asigna los valores a los parámetros de la consulta preparada
    $stmt->bindParam(':legajo', $legajo, PDO::PARAM_INT);
    $stmt->bindParam(':materia', $materia, PDO::PARAM_INT);
    $stmt->bindParam(':nota', $nota, PDO::PARAM_INT);
    $stmt->bindParam(':acta', $acta, PDO::PARAM_INT);

    if ($stmt->execute()) {
        $message = "Notas registradas con éxito.";
    } else {
        $message = "Error al registrar las notas: " . print_r($stmt->errorInfo(), true);
    }
    
    echo "<script>alert('$message');</script>";

    } catch (PDOException $e) {
        echo "Error en la consulta: " . $e->getMessage();
    }
    
    // Cierra la conexión
    $conn = null;
}
include('portal_docente.php');
?>

