<?php

// INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';
include 'constantes.php';

// REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
// DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.html");
    //echo "Verdadero </br>";
}

// DECLARAR VARIABLES
$_SESSION['alumno_inscripto'] = "";
$_SESSION['viene_de'] = ROL_ALUMNO;

// CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();

// BUSCO LAS CARRERAS DISPONIBLES EN LA BD
$consulta = selectCarrerasInscripcion($conexion);

// RECUPERO LOS RESULTADOS OBTENIDOS
$resultado = $consulta->fetchAll();

// ZONA DE PRUEBAS INICIO



// ZONA DE PRUEBAS FIN

include('inscripcion_alumno.html');