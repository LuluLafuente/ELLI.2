<?php
session_start();

// Verificar si la sesión está iniciada
if(isset($_SESSION['usuario'])) {
    // La sesión está iniciada, redirigir al portal correspondiente
    if(isset($_SESSION['u_rol']) && $_SESSION['u_rol'] === 1) {
        header("Location: portal_administrador.php");
        exit();
    } elseif(isset($_SESSION['u_rol']) && $_SESSION['u_rol'] === 2) {
        header("Location: portal_docente.php");
        exit();
    } elseif(isset($_SESSION['u_rol']) && $_SESSION['u_rol'] === 3) {
        header("Location: portal_alumno.php");
        exit();
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
    <!-- Estilos y otros elementos de la cabecera -->
</head>
<body>
    <!-- Formulario de inicio de sesión -->
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
    <!-- Estilos y otros elementos de la cabecera -->
</head>
<body>
    <!-- Formulario de inicio de sesión -->
</body>
</html>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bienvenid@s</title>
	<link rel="stylesheet" type="text/css" href="css/styleIndex.css">
</head>

<body>
	<div class="container">
		<div class="card">
			<figure>
				<img src="img/notes.svg">
			</figure>
			<div class="contenido">
				<h3>Administracion</h3>
				<a href="login_admin.php">Ingresar</a>
			</div>
		</div>
		<div class="card">
			<figure>
				<img src="img/teacher.svg">
			</figure>
			<div class="contenido">
				<h3>Docente</h3>
				<a href="login_docente.php">Ingresar</a>
			</div>
		</div>
		<div class="card">
			<figure>
				<img src="img/log.svg">
			</figure>
			<div class="contenido">
				<h3>Alumno</h3>
				<a href="login_alumno.php">Ingresar</a>
			</div>
		</div>
	</div>
</body>

</html>