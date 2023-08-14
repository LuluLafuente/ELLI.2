<?php
// Se verifica si se enviaron los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene los datos del formulario
    $legajo = $_POST["alumno"];
    $materia = $_POST["materia"];
    $nota = $_POST["nota"];
    $folio = $_POST["folio"];
    $num_libro = $_POST["num_libro"];
    $fecha = $_POST["fecha"];

//conexion a la base
    $host = "127.0.0.1";
    $dbNombre = "bd_prueba";
    $usuario = "isetEducativo";
    $contrasenia = "unaClaveMuyDificil1";


try {
    $conn = new PDO("mysql:host=$host; dbname=$dbNombre", $usuario, $contrasenia);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "INSERT INTO examen_final(ID_MATERIA, LIBRO, FOLIO, FECHA) VALUES (:materia, :num_libro, :folio, :fecha)";

    $stmt = $conn->prepare($sql);

    $stmt->bindParam(':materia', $materia, PDO::PARAM_INT);
    $stmt->bindParam(':num_libro', $num_libro, PDO::PARAM_INT);
    $stmt->bindParam(':folio', $folio, PDO::PARAM_INT);
    $stmt->bindParam(':fecha', $fecha, PDO::PARAM_STR);

    if ($stmt->execute()) {
        $lastInsertedId = $conn->lastInsertId(); // Obtén el último ID autoincremental insertado
        
        $sql1 = "INSERT INTO rinde(ID_EXAMEN, ID_ALUMNO, ID_MATERIA, NOTA, FECHA) VALUES (:id_examen, :legajo, :materia, :nota, :fecha)";
        
        $stmt1 = $conn->prepare($sql1);

        // Asigna el ID_EXAMEN obtenido anteriormente
        $stmt1->bindParam(':id_examen', $lastInsertedId, PDO::PARAM_INT);
        $stmt1->bindParam(':legajo', $legajo, PDO::PARAM_STR);
        $stmt1->bindParam(':materia', $materia, PDO::PARAM_INT);
        $stmt1->bindParam(':nota', $nota, PDO::PARAM_INT);
        $stmt1->bindParam(':fecha', $fecha, PDO::PARAM_STR);

        if ($stmt1->execute()) {
            $message = "Notas registradas con éxito.";
        } else {
            $message = "Error al registrar las notas en la tabla rinde: " . print_r($stmt1->errorInfo(), true);
        }
    } else {
        $message = "Error al registrar las notas en la tabla examen_final: " . print_r($stmt->errorInfo(), true);
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

