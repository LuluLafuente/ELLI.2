<?php
// Verifica si se enviaron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $legajo = $_POST["alumno"];
    $materia = $_POST["materia"];
    $nota = $_POST["nota"];
    $folio = $_POST["folio"];
    $numero_libro = $_POST["numero_libro"];
    $fecha = $_POST["fecha"];

    // Aquí puedes realizar la conexión a la base de datos con tus credenciales
    $host = "127.0.0.1";
    $dbNombre = "bd_prueba";
    $usuario = "isetEducativo";
    $contrasenia = "unaClaveMuyDificil1";

    try {
        //EJECUTO LA CONEXION CON LA CLASE PDO DE PHP
        $conn = new PDO("mysql:host=$host; dbname=$dbNombre", $usuario, $contrasenia);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepara la consulta SQL para actualizar los datos en la tabla utilizando consultas preparadas
        $sql = "UPDATE examen_final SET FINAL=:nota, ID_FOLIO=:folio, ID_LIBRO=:numero_libro, FECHA=:fecha WHERE ID_MATERIA = :materia AND ID_ALUMNO = :legajo";
        $stmt = $conn->prepare($sql);

        // Asigna los valores a los parámetros de la consulta preparada
        $stmt->bindParam(':legajo', $legajo, PDO::PARAM_INT);
        $stmt->bindParam(':materia', $materia, PDO::PARAM_INT);
        $stmt->bindParam(':nota', $nota, PDO::PARAM_INT);
        $stmt->bindParam(':folio', $folio, PDO::PARAM_INT);
        $stmt->bindParam(':numero_libro', $numero_libro, PDO::PARAM_INT);
        $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);

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
include('examen_final.php');
?>

?>

