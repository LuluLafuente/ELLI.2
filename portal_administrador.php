<?php

// INICIO SESION
session_start();

// AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';

// REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
// DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.html");
    //echo "Verdadero </br>";
}

// DECLARAR VARIABLES

// CONEXION CON LA BASE DE DATOS

// BUSCAR LA LISTA DE ALUMNOS INSCRIPTOS

// GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE

// ZONA DE PRUEBAS INICIO

// ZONA DE PRUEBAS FIN

include('portal_administrador.html');