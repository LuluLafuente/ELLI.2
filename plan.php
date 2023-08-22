<?php

//INICIO SESION
session_start();

//AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';

//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.html");
    //echo "Verdadero </br>";
}

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();

//BUSCAR PLAN DE ESTUDIOS
$consulta = selectPlanEstudio($conexion, $_SESSION["u_carrera"]);

//GUARDO LOS RESULTADOS DEL PLAN EN UNA VARIABLE
$resultado = $consulta->fetchAll();

//ZONA DE PRUEBAS INICIO



//ZONA DE PRUEBAS FIN

// CARGO LA PÁGINA CORRESPONDIENTE
include('plan.html');
