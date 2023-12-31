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
$consulta1 = selectCarrera($conexion);
$consulta2 = selectMaterias($conexion);
$consulta3 = selectAlumnosCursado($conexion);


//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado1 = $consulta1->fetchAll();
$resultado2 = $consulta2->fetchAll();
$resultado3 = $consulta3->fetchAll();

include('examen_parcial.html');
?>