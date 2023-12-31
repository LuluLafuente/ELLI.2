<?php

//INICIO SESION
session_start();

//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.php");
    //exit;
}
//AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';

//DECLARAR VARIABLES
$listaMaterias = [];

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();


//BUSCAR LA LISTA DE ALUMNOS DE SU MATERIA
$consulta = selectAlumnosCursado($conexion);
$consulta1 = selectCarrera($conexion);
$consulta2 = selectMaterias($conexion);
$consulta3 = selectIdExamen($conexion);
$consulta4 = selectAlumnosFinal($conexion);


//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado = $consulta->fetchAll();
$resultado1 = $consulta1->fetchAll();
$resultado2 = $consulta2->fetchAll();
$resultado3 = $consulta3->fetchAll();
$resultado4 = $consulta4->fetchAll();


include('examen_final.html');