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

//CONEXION CON LA BASE DE DATOS
$conexion = conexionDB();


$query = "SELECT MAX(ID_EXAMEN_FINAL) AS num_mesa,
MAX(LIBRO) AS num_libro, MAX(FOLIO) AS num_folio FROM examen_final";
$statement = $conexion->prepare($query);
$statement->execute();
$resultado = $statement->fetch(PDO::FETCH_ASSOC);

$num_mesa = $resultado['num_mesa'];
$num_libro = $resultado['num_libro'];
$num_folio = $resultado['num_folio'];



//Busqueda de carrera y materias
$consulta1 = selectCarrera($conexion);
$consulta2 = selectMaterias($conexion);
$consulta3 = selectAlumnosCursado($conexion);


//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado1 = $consulta1->fetchAll();
$resultado2 = $consulta2->fetchAll();
$resultado3 = $consulta3->fetchAll();




include('crear_mesa.html');