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

//DECLARAR VARIABLES
$listaMaterias = [];

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();

//BUSCAR LA LISTA DE MATERIAS
$consulta = selectAprobadas($conexion, $_SESSION["u_legajo"]);
$consulta2 = selectMaterias($conexion);


//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado = $consulta->fetchAll();
$resultado2 = $consulta2->fetchAll();

//ZONA DE PRUEBAS INICIO



//ZONA DE PRUEBAS FIN

include('libreta.html');
