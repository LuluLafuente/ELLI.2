<?php

// INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';

// REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
// DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
   //header("location:index.php");
    //exit;
}

// DECLARAR VARIABLES
$listaMaterias = [];

// CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();

//Busqueda de datos
$consulta = selectListaParciales($conexion);
$consulta1 = selectAlumnosCursado($conexion);
$consulta2 = selectMaterias($conexion);
$consulta3 = selectCarrera($conexion);


//Se guardan datos
$resultado = $consulta->fetchAll();
$resultado1 = $consulta1->fetchAll();
$resultado2 = $consulta2->fetchAll();
$resultado3 = $consulta3->fetchAll();




include('ver_notas_cursado.html');