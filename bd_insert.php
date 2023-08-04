<?php
    
    //FUNCION PARA AGREGAR LOS ALUMNOS A LA BASE DE DATOS
    function agregarAlumno(
        $con, 
        $legajo,  $dni,     $nombre,      $apellido, 
        $rol,     $usuario, $contrasenia, $domicilio, $domicilioNro, 
        $celular, $anio,    $carrera,     $red_fb, 
        $red_ig,  $red_tw,  $foto,        $fecha,
        $error){

        //EJECUTO LA CONSULTA CON LOS DATOS RECIBIDOS
        $alu_i = inscribirAlumno(
            $con, 
            $dni,     $nombre,      $apellido,  $rol,
            $usuario, $contrasenia, $domicilio, $domicilioNro, 
            $celular, $red_fb,      $red_ig,    $red_tw,
            $foto);

        // BUSCO EL ID DE LA COHORTE DEL ALUMNO
        $cohorte = cohorteAlumno($con, $carrera, $anio, $error);

        // REGISTRO EL LEGAJO DEL DOCENTE EN LA BD
        $alu_l = inscribirLegajoAlu($con, $dni, $legajo, $carrera, $cohorte, $fecha);

        //DEVUELVO EL RESULTADO DE LA OPERACION
        return $alu_i === true && $alu_l === true ? true: false;
    }

    function cohorteAlumno($con, $carrera, $anio, $error){
        /*CREAR FUNCION PARA BUSCAR EL ID DE LA COHORTE*/
        $buscarCohorte = $con->query("SELECT `ID_COHORTE`
                                        FROM `cohorte`
                                       WHERE `ID_CARRERA` = $carrera AND YEAR(`ANIO`) = $anio;");

        if(is_object($buscarCohorte)){
            $resultado = $buscarCohorte->fetchAll();

            if($buscarCohorte->rowCount() === 0){
                $errores .= "<p>El año ingresado no tiene una cohorte asignada. " . 
                "Por favor revise que la cohorte exista y que el año sea el correcto.</p>";

                return 0;
            }
            else{
                return $resultado[0]["ID_COHORTE"];    
            }
        }
        else{
            $errores .= "<p>Ocurrió un error al asignar una cohorte al alumno. " . 
            "Contactese con el administrador del sistema para consultar por el error.</p>";

            return 0;
        }
    }

    function inscribirAlumno(
        $con, 
        $dni,     $nombre,      $apellido,  $rol,
        $usuario, $contrasenia, $domicilio, $domicilioNro, 
        $celular, $red_fb,      $red_ig,    $red_tw,
        $foto){

        $inscribirAlu = $con->query("INSERT INTO `Alumno`  (`DNI`,     `NOMBRE`,       `APELLIDO`,      `ROL_ALUMNO`,
                                                            `USUARIO`, `CONTRASENIA`,  `DOMICILIO`,     `NRO_DOMICILIO`,
                                                            `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`, 
                                                            `FOTO_ALU`)
                                            VALUES         ($dni,       '$nombre',      '$apellido',  $rol,
                                                            '$usuario', '$contrasenia', '$domicilio', $domicilioNro,
                                                            $celular,   '$red_fb',      '$red_ig',    '$red_tw',     
                                                            '$foto');");

        return $inscribirAlu === false ? false : true;
    }
    
    function inscribirLegajoAlu($con, $dni, $legajo, $carrera, $cohorte, $fecha){
        $legajoAgregado = $con->query("INSERT INTO `legajo_alumno` (`DNI`, `LEGAJO_ALU`, `CARRERA`,  `COHORTE`, `FECHA_INSCRIPCION`)
                                            VALUES                 ($dni, '$legajo', $carrera, $cohorte, '$fecha');");

        return $legajoAgregado === false ? false : true;
    }

    function agregarDocente(
        $con,       
        $legajo,       $dni,     $nombre,      $apellido,
        $rol,          $usuario, $contrasenia, $domicilio,
        $domicilioNro, $celular, $carrera,     $red_fb,
        $red_ig,       $red_tw,  $foto,        $fecha){

        // REGISTRO AL DOCENTE EN LA BD
        $doc_i = inscribirDocente(
                    $con, 
                    $dni,     $nombre,      $apellido,  $rol,
                    $usuario, $contrasenia, $domicilio, $domicilioNro, 
                    $celular, $red_fb,      $red_ig,    $red_tw,
                    $foto);

        // REGISTRO EL LEGAJO DEL DOCENTE EN LA BD
        $doc_l = inscribirLegajoDoc($con, $dni, $legajo, $carrera, $fecha);

        //DEVUELVO EL RESULTADO DE LA OPERACION
        return $doc_i === true && $doc_l === true ? true: false;
    }

    function inscribirDocente(
        $con, 
        $dni,     $nombre,      $apellido,  $rol,
        $usuario, $contrasenia, $domicilio, $domicilioNro, 
        $celular, $red_fb,      $red_ig,    $red_tw,
        $foto){

        $inscribirDoc = $con->query("INSERT INTO `docente` (`DNI`,     `NOMBRE`,       `APELLIDO`,      `ROL_DOCENTE`,
                                                               `USUARIO`, `CONTRASENIA`,  `DOMICILIO`,     `NRO_DOMICILIO`, 
                                                               `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`,   
                                                               `FOTO_DOC`)
                                             VALUES           ($dni,       '$nombre',      '$apellido',  $rol,   
                                                               '$usuario', '$contrasenia', '$domicilio', $domicilioNro,   
                                                               $celular,   '$red_fb',      '$red_ig',    '$red_tw',       
                                                               '$foto');");

        return $inscribirDoc === false ? false : true;
    }

    function inscribirLegajoDoc($con, $dni, $legajo, $carrera, $fecha){
        $legajoAgregado = $con->query("INSERT INTO `legajo_docente` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
                                            VALUES                  ($dni,  '$legajo',    $carrera,  '$fecha');");

        return $legajoAgregado === false ? false : true;
    }
?>