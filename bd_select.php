<?php
    //FUNCION UTILIZADA PARA SELECCIONAR Y COMPARAR SI EL ADMINISTARTIVO EXISTE
    function selectAdministrativo($con, $u, $c){
        $consulta = $con->query("SELECT * 
                                   FROM administrativo 
                                  WHERE usuario = '$u' 
                                    AND contrasenia = '$c';");

        return $consulta;
    }

    //FUNCION UTILIZADA PARA SELECCIONAR Y COMPARAR SI EL EMPLEADO EXISTE
    function selectEmpleado($con, $u, $c){
        $consulta = $con->query("SELECT * 
                                   FROM docente 
                                  WHERE usuario = '$u' 
                                    AND contrasenia = '$c';");

        return $consulta;
    }

    //FUNCION UTILIZADA PARA SELECCIONAR Y COMPARAR SI EL ALUMNO EXISTE
    function selectAlumno($con, $u, $c){
        $consulta = $con->query("SELECT * 
                                   FROM alumno 
                                  WHERE usuario = '$u' 
                                    AND contrasenia = '$c';");

        return $consulta;
    }

    // BUSCA LAS MATERIAS DISPONIBLES
    function selectMaterias($con){
        $consulta = $con->query("SELECT Id_Materia,
                                        Anio,
                                        Nombre
                                   FROM Materia;");

        return $consulta;
    }

    // BUSCA LAS MATERIAS APROBADAS DEL ALUMNO
    function selectAprobadas($con){
        $consulta = $con->query("SELECT *
                                   FROM vw_nota_alumno;");

        return $consulta;
    }

    // DEVUELVE EL PLAN DE ESTUDIO DEL ALUMNO, SEGUN LA CARRERA
    function selectPlanEstudio($con, $carrera){
        $consulta = $con->query("SELECT *
                                   FROM vw_plan_estudio
                                  WHERE anio = $carrera");

        return $consulta;
        
    }

    // DEVUELVE EL ROL DEL DOCENTE SEGUN SU USUARIO (MAIL)
    function selectRolDoc($con, $mail){
        $consulta = $con->query("SELECT rol_docente
                                   FROM docente
                                  WHERE usuario = '$mail';");

        return $consulta;
    }

    // DEVUELVE EL ROL DEL ADMINISTRATIVO SEGUN SU USUARIO (MAIL)
    function selectRolAdm($con, $mail){
        $consulta = $con->query("SELECT `rol_administrativo` 
                                   FROM `administrativo` 
                                  WHERE `usuario` = '$mail';");
        
        return $consulta;
    }

    // DEVUELVE EL ROL DEL ALUMNO SEGUN SU USUARIO (MAIL)
    function selectRolAlu($con, $mail){
        $consulta = $con->query("SELECT rol_alumno
                                   FROM alumno
                                  WHERE usuario = '$mail'");

        return $consulta;
    }

    // BUSCO TODOS LOS ALUMNOS QUE ESTAN CURSANDO ALGUNA MATERIA
    function selectalumnosCursado($con, $idMateria){
        $consulta = $con->query("SELECT *
                                   FROM vw_cursado
                                  WHERE materia = '$idMateria'");

        return $consulta;
    }

    // BUSCO TODOS LOS ALUMNOS QUE ESTAN CURSANDO ALGUNA MATERIA
    function selectAlumnosTodos($con, $idMateria){
        $consulta = $con->query("SELECT *
                                   FROM vw_cursado
                                  WHERE materia = '$idMateria'");

        return $consulta;
    }

    // BUSCA LA CANTIDAD DE ALUMNOS INSCRIPTOS POR AÑO
    function selectAlumnosCantInsc($con, $anio){
        $consulta = $con->query("SELECT COUNT(anio)
                                   FROM alumno
                                  WHERE ANIO = $anio;");

        return $consulta;
    }

    function selectCarrera($con){
        $consulta = $con->query("SELECT id_carrera, nombre 
                                   FROM carrera;");
        return $consulta;
    }

    // BUSCA EL ABREVIADO DE UNA CARRERA SEGUN SU ID
    function selectCarreraAbreviado($con, $nroCarrera){
        $consulta = $con->query("SELECT abreviado
                                   FROM carrera
                                  WHERE id_carrera = $nroCarrera;");

        $resultado = $consulta->fetchAll();

        return $resultado[0]["abreviado"];
    }

    function selectAlumnos($con){
        $consulta = $con->query("SELECT LEGAJO_ALU, CONCAT(nombre,' ',apellido)As Name 
                                from alumno");
        return $consulta;

    }

    // BUSCA LA CANTIDAD DE ALUMNOS INSCRIPTOS EN UNA CARRERA Y AÑO DETERMINADO
    function selectNroDeAlumnosInscriptos($con, $carrera, $anio){
        $consulta = $con->query("SELECT inscriptos
                                   FROM vw_alumnos_insc_carrera
                                  WHERE CARRERA = '$carrera' AND ANIO = $anio;");

        if(is_object($consulta)){   
            if($consulta->rowCount() === 0){
                return 0;
            }
            else{
                $resultado = $consulta->fetchAll();

                return $resultado[0]["inscriptos"];
            }
        }
        else{
            return 0;
        }
    }

    // BUSCA LA CANTIDAD DE DOCENTES INSCRIPTOS EN CADA CARRERA
    function selectNroDeDocentesInscriptos($con, $abreviado){
        $consulta = $con->query("SELECT inscriptos
                                   FROM vw_docentes_inscriptos_carrera
                                  WHERE abreviado = '$abreviado';");

        if(is_object($consulta)) {
            $resultado = $consulta->fetchAll();

            if($consulta->rowCount() === 0){
                $cantidad = 0;
            }
            else{
                $cantidad = $resultado[0]["inscriptos"];
            }
        }
        else{
            $cantidad = 0;
        }

        return $cantidad;
    }

    // DEVUELVE EL DNI DE UN ALUMNO INSCRIPTO
    function selectDniAlumnosInscriptos($con, $dni){
        $consulta = $con->query("SELECT dni
                                   FROM alumno
                                  WHERE dni = $dni;");

        $resultado = $consulta->fetchAll();

        return !isset($resultado[0]["dni"]) ? 0 : $resultado[0]["dni"];
    }

    // DEVUELVE EL DNI DE UN DOCENTE INSCRIPTO
    function selectDniDocentesInscriptos($con, $dni){
        $consulta = $con->query("SELECT dni
                                   FROM docente
                                  WHERE dni = $dni;");

        $resultado = $consulta->fetchAll();

        return !isset($resultado[0]["dni"]) ? 0 : $resultado[0]["dni"];
    }

    // BUSCA EL ID DE LA CARRERA DEL ALUMNO DESDE LOS LEGAJOS
    function selectCarreraAlumnosInscriptos($con, $dni){
        $consulta = $con->query("SELECT carrera
                                   FROM alumno
                                  WHERE dni = $dni;");

        return $consulta;
    }

    // BUSCA EL ID DE LA CARRERA DEL DOCENTE DESDE LOS LEGAJOS
    function selectCarreraDocentesInscriptos($con, $carrera){
        $consulta = $con->query("SELECT carrera
                                   FROM legajo_docente
                                  WHERE carrera = $carrera;");

        return $consulta;
    }

    function selectListaNotas($con){
        $consulta = $con->query("SELECT * FROM vw_finaladmin;");

        return $consulta;
    }

    function selectListaParciales($con){
        $consulta = $con->query("SELECT * FROM vw_examenadmin");
        
        return $consulta;

    }
    function selectHistoriaAlumno($con){
        $consulta = $con->query("SELECT materia,final,id_acta FROM examenfinal");

        return $consulta;
    }

    // BUSCA EL ID Y EL NOMBRE DE LAS CARRERAS DISPONIBLES EN LA BD
    function selectCarrerasInscripcion($con){
        $consulta = $con->query("SELECT ID_CARRERA,
                                        NOMBRE
                                   FROM CARRERA;");

        return $consulta;
    }
?>