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
$consulta = selectAprobadas($conexion);

//GUARDO TODOS LOS RESULTADOS EN UNA VARIABLE
$resultado = $consulta->fetchAll();

//BUSCAR PLAN DE ESTUDIOS
$planEstudio = selectPlanEstudio($conexion, $_SESSION["u_carrera"]);

//GUARDO LOS RESULTADOS DEL PLAN EN UNA VARIABLE
$resultadoPlan = $planEstudio->fetchAll();

//ZONA DE PRUEBAS INICIO

//echo $_SESSION["usuario"];
//echo "Filas encontradas: " . $consulta->rowCount() . "</br>";

//echo "</br>PRUEBA 1</br>";

/*
for ($i=0; $i < $consulta->rowCount(); $i++) { 

    if($resultado[$i]["Anio"] == 1){
        echo $resultado[$i]["Id_Materia"] . " " . $resultado[$i]["Anio"] . " " . $resultado[$i]["Nombre"] . "</br>";
    }
    elseif ($resultado[$i]["Anio"] == 2) {
        echo $resultado[$i]["Id_Materia"] . " " . $resultado[$i]["Anio"] . " " . $resultado[$i]["Nombre"] . "</br>";
    }
    elseif ($resultado[$i]["Anio"] == 3) {
        echo $resultado[$i]["Id_Materia"] . " " . $resultado[$i]["Anio"] . " " . $resultado[$i]["Nombre"] . "</br>";
    }
}
*/

//var_dump($resultado[0]) . "</br>";
//print_r($resultado[0]) . "</br></br>";

/*
echo "</br>PRUEBA 2</br>";

foreach ($resultado as $fila) {
    echo $fila[0] . " " . $fila[1] . " " . $fila[2] . "</br>";
}

*/

/*
//PRUEBAS DE DATOS RECIBIDOS DEL PLAN DE ESTUDIO
echo "</br>PRUEBA 3</br>";
echo $resultadoPlan[0]["CARRERA"] . "</br>";
echo $resultadoPlan[0]["ID_MATERIA"] . "</br>";
echo $resultadoPlan[0]["NOMBRE"] . "</br>";
echo $resultadoPlan[0]["ANIO"] . "</br>";
*/
//ZONA DE PRUEBAS FIN

include('plan.html');
