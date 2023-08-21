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
        $consulta = $con->query("  SELECT d.NOMBRE,
                                          d.APELLIDO,
                                          ld.LEGAJO_DOC,
                                          d.DNI,
                                          d.ROL_DOCENTE,
                                          ld.CARRERA,
                                          d.FOTO_DOC
                                     FROM docente d
                                     JOIN legajo_docente ld ON ld.DNI = d.DNI
                                    WHERE d.USUARIO = '$u' AND d.CONTRASENIA = '$c'
                                 GROUP BY ld.LEGAJO_DOC;");

        return $consulta;
    }

    //FUNCION UTILIZADA PARA SELECCIONAR Y COMPARAR SI EL ALUMNO EXISTE
    function selectAlumno($con, $u, $c){
        $consulta = $con->query("  SELECT al.`NOMBRE`,
                                          al.`APELLIDO`,
                                          la.`LEGAJO_ALU`,
                                          al.`DNI`,
                                          al.`ROL_ALUMNO`,
                                          la.`CARRERA`,
                                          YEAR(c.`ANIO`) AS 'ANIO',
                                          al.`FOTO_ALU`
                                     FROM `alumno` al
                                     JOIN `legajo_alumno` la ON la.`DNI` = al.`DNI`
                                     JOIN `cohorte` c        ON c.`ID_CARRERA` = la.`CARRERA`
                                    WHERE al.`USUARIO` = '$u' AND al.`CONTRASENIA` = '$c'
                                 GROUP BY la.`LEGAJO_ALU`;");

        return $consulta;
    }

    // BUSCA LAS MATERIAS DISPONIBLES
    function selectMaterias($con){
        $consulta = $con->query("SELECT *
                                   FROM Materia");

        return $consulta;
    }

    // BUSCA LAS MATERIAS APROBADAS DEL ALUMNO Libreta
    function selectAprobadas($con,$legajo){
        $consulta = $con->query("SELECT *
                                   FROM vw_nota_alumno WHERE LEGAJO = '$legajo';");

        return $consulta;
    }

    // DEVUELVE EL PLAN DE ESTUDIO DEL ALUMNO, SEGUN LA CARRERA
    function selectPlanEstudio($con, $carrera){
        $consulta = $con->query("SELECT *
                                   FROM vw_plan_estudio WHERE ID_CARRERA= '$carrera';");

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
                                  WHERE usuario = '$mail';");

        return $consulta;
    }

    // BUSCO TODOS LOS ALUMNOS QUE ESTAN CURSANDO ALGUNA MATERIA
    function selectAlumnosCursado($con){
        $consulta = $con->query("SELECT *
                                   FROM vw_cursado;");

        return $consulta;
    }
    //Busco a todos los alumnos que rinden en la mesa
    function selectAlumnosFinal($con){
        $consulta=$con->query("SELECT DISTINCT c.ALUMNO, r.ID_ALUMNO, r.ID_MATERIA FROM rinde r INNER JOIN vw_cursado c on r.ID_ALUMNO = c.LEGAJO;");

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
        $consulta = $con->query("SELECT DISTINCT LEGAJO, ALUMNO FROM vw_cursado");
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
    function selectCarreraAlumnosInscriptos($con, $dni,$carr){
        $consulta = $con->query("SELECT carrera
                                   FROM legajo_alumno
                                  WHERE dni = $dni AND carrera = $carr;");

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
        $consulta = $con->query("SELECT * FROM vw_admin_final;");

        return $consulta;
    }

    function selectListaParciales($con){
        $consulta = $con->query("SELECT * FROM vw_admin_examen");
        
        return $consulta;

    }
    function selectHistoriaAlumno($con,$legajo){
        $consulta = $con->query("SELECT * FROM vw_admin_final WHERE LEGAJO_ALU = '$legajo'");

        return $consulta;
    }

    // BUSCA EL ID Y EL NOMBRE DE LAS CARRERAS DISPONIBLES EN LA BD
    function selectCarrerasInscripcion($con){
        $consulta = $con->query("SELECT ID_CARRERA,
                                        NOMBRE
                                   FROM CARRERA;");

        return $consulta;
    }

    //Busca ID de examen, libro y folio
    function selectIdExamen($con)
    {
        $consulta = $con->query("SELECT * FROM examen_final");

        return $consulta;
    }

?>