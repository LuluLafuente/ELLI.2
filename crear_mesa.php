<?php

//INICIO SESION
session_start();

//AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';

//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.php");
    //exit;
}

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();


//Busqueda de carrera y materias
$consulta1 = selectCarrera($conexion);
$consulta2 = selectMaterias($conexion);

//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado1 = $consulta1->fetchAll();
$resultado2 = $consulta2->fetchAll();


include('crear_mesa.html');