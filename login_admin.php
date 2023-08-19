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
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://kit.fontawesome.com/c0959f9251.js" crossorigin="anonymous">
  </script>
  <link rel="stylesheet" href="css/styleLogin.css" />
  <link rel="icon"
    href="https://iset-tuc.infd.edu.ar/sitio/wp-content/plugins/edupress-escuela/public/skins/redinfod/img/favicon_32x32.png"
    sizes="32x32">
  <link rel="icon"
    href="https://iset-tuc.infd.edu.ar/sitio/wp-content/plugins/edupress-escuela/public/skins/redinfod/img/favicon_192x192.png"
    sizes="192x192">

  <title>Inicio de Sesion</title>
</head>

<body>
  <div class="container">
    <div class="forms-container">
      <div class="signin-signup">
        <form action="login_validar.php" method="post" class="sign-in-form">
          <h2 class="title"> ¡Bienvenido Administrador! </h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="email" placeholder="Usuario" name="usuario" />
          </div>
          <div class="input-field">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="Clave" name="clave" />
          </div>
          <input type="submit" value="Ingresar" class="btn" /></a>
        </form>

        <form class="sign-up-form" action="https://formspree.io/f/mzbwnagk" method="POST">
          <h2 class="title">¿Olvidaste tu clave?</h2>
          <h4>Indica tu nombre y correo electronico</h4>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="Nombre Completo" name="nombre-Recupero-Admin" />
          </div>
          <div class="input-field">
            <i class="fa-regular fa-envelope"></i>
            <input type="email" placeholder="Correo" name="mail-Recupero-Admin" />
          </div>
          <input type="submit" value="Enviar" class="btn">
        </form>
      </div>
    </div>

    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>¿Olvidaste tu clave?</h3>
          <p>
            No te preocupes, ingresa tu email y nos encargamos del resto.
          </p>
          <button class="btn transparent" id="sign-up-btn">
            Nueva Clave
          </button>
        </div>
        <img src="img/notes.svg" class="image" alt="" />
      </div>
      <div class="panel right-panel">
        <div class="content">
          <h3>¿Recuperaste tu clave?</h3>
          <p>
            Perfecto. Ingresa aqui para continuar.
          </p>
          <button class="btn transparent" id="sign-in-btn">
            Ingresar
          </button>
        </div>
        <img src="img/social.svg" class="image" alt="" />
      </div>
    </div>
  </div>

  <script src="js/app.js"></script>
</body>

</html>