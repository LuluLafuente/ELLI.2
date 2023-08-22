<?php

// FUNCION PARA AGREGAR LOS ALUMNOS A LA BASE DE DATOS
function agregarAlumno(
    $con,
    $legajo, $dni, $nombre, $apellido,
    $rol, $usuario, $contrasenia, $domicilio, $domicilioNro,
    $celular, $anio, $carrera, $red_fb,
    $red_ig, $red_tw, $foto, $fecha,
    &$error
) {
    $con->beginTransaction();
    try{
            // EJECUTO LA CONSULTA CON LOS DATOS RECIBIDOS
            $alu_i = inscribirAlumno(
                $con,
                $dni, $nombre, $apellido, $rol,
                $usuario, $contrasenia, $domicilio, $domicilioNro,
                $celular, $red_fb, $red_ig, $red_tw,
                $foto
            );

            if (!$alu_i) {
                $error .= "<p>Error al inscribir al alumno.</p>";
                return false;
            }

            // BUSCO EL ID DE LA COHORTE DEL ALUMNO
            $cohorte = cohorteAlumno($con, $carrera, $anio, $error);

            if ($cohorte === 0) {
                return false;
            }

            // REGISTRO EL LEGAJO DEL DOCENTE EN LA BD
            $alu_l = inscribirLegajoAlu($con, $dni, $legajo, $carrera, $cohorte, $fecha);

            if (!$alu_l) {
                $error .= "<p>Error al inscribir el legajo del alumno.</p>";
                return false;
            }
            $con->commit();

        } catch(PDOException $e) {
    // Si ocurre un error, deshacemos la transacción y mostramos el mensaje de error
            $con->rollback();
            echo "Error en la consulta: " . $e->getMessage();
            return false;
    }


    // DEVUELVO EL RESULTADO DE LA OPERACION
    return true;
}
}

function cohorteAlumno($con, $carrera, $anio, &$error)
{
    /* CREAR FUNCION PARA BUSCAR EL ID DE LA COHORTE */
    $buscarCohorte = $con->query("SELECT `ID_COHORTE`
                                    FROM `cohorte`
                                    WHERE `ID_CARRERA` = $carrera AND YEAR(`ANIO`) = $anio;");

    if (is_object($buscarCohorte)) {
        $resultado = $buscarCohorte->fetchAll();

        if ($buscarCohorte->rowCount() === 0) {
            $error .= "<p>El año ingresado no tiene una cohorte asignada. " .
                "Por favor revise que la cohorte exista y que el año sea el correcto.</p>";

            return 0;
        } else {
            return $resultado[0]["ID_COHORTE"];
        }
    } else {
        $error .= "<p>Ocurrió un error al asignar una cohorte al alumno. " .
            "Contactese con el administrador del sistema para consultar por el error.</p>";

        return 0;
    }
}

function inscribirAlumno(
    $con,
    $dni, $nombre, $apellido, $rol,
    $usuario, $contrasenia, $domicilio, $domicilioNro,
    $celular, $red_fb, $red_ig, $red_tw,
    $foto
) {
    $inscribirAlu = $con->query("INSERT INTO `Alumno` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_ALUMNO`,
                                                            `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`,
                                                            `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`,
                                                            `FOTO_ALU`)
                                        VALUES ($dni, '$nombre', '$apellido', $rol,
                                                            '$usuario', '$contrasenia', '$domicilio', $domicilioNro,
                                                            $celular, '$red_fb', '$red_ig', '$red_tw',
                                                            '$foto');");

    return $inscribirAlu === false ? false : true;
}

function inscribirLegajoAlu($con, $dni, $legajo, $carrera, $cohorte, $fecha)
{
    $legajoAgregado = $con->query("INSERT INTO `legajo_alumno` (`DNI`, `LEGAJO_ALU`, `CARRERA`,  `COHORTE`, `FECHA_INSCRIPCION`)
                                            VALUES ($dni, '$legajo', $carrera, $cohorte, '$fecha');");

    return $legajoAgregado === false ? false : true;
}

function agregarDocente(
    $con,
    $legajo, $dni, $nombre, $apellido,
    $rol, $usuario, $contrasenia, $domicilio,
    $domicilioNro, $celular, $carrera, $red_fb,
    $red_ig, $red_tw, $foto, $fecha
) {

    // REGISTRO AL DOCENTE EN LA BD
    $doc_i = inscribirDocente(
        $con,
        $dni, $nombre, $apellido, $rol,
        $usuario, $contrasenia, $domicilio, $domicilioNro,
        $celular, $red_fb, $red_ig, $red_tw,
        $foto
    );

    if (!$doc_i) {
        $error .= "<p>Error al inscribir al docente.</p>";
        return false;
    }

    // REGISTRO EL LEGAJO DEL DOCENTE EN LA BD
    $doc_l = inscribirLegajoDoc($con, $dni, $legajo, $carrera, $fecha);

    if (!$doc_l) {
        $error .= "<p>Error al inscribir el legajo del docente.</p>";
        return false;
    }

    // DEVUELVO EL RESULTADO DE LA OPERACION
    return true;
}

function inscribirDocente(
    $con,
    $dni, $nombre, $apellido, $rol,
    $usuario, $contrasenia, $domicilio, $domicilioNro,
    $celular, $red_fb, $red_ig, $red_tw,
    $foto
) {
    $inscribirDoc = $con->query("INSERT INTO `docente` (`DNI`, `NOMBRE`, `APELLIDO`, `ROL_DOCENTE`,
                                                               `USUARIO`, `CONTRASENIA`, `DOMICILIO`, `NRO_DOMICILIO`,
                                                               `CELULAR`, `RED_FACEBOOK`, `RED_INSTAGRAM`, `RED_TWITTER`,
                                                               `FOTO_DOC`)
                                             VALUES ($dni, '$nombre', '$apellido', $rol,
                                                               '$usuario', '$contrasenia', '$domicilio', $domicilioNro,
                                                               $celular, '$red_fb', '$red_ig', '$red_tw',
                                                               '$foto');");

    return $inscribirDoc === false ? false : true;
}

function inscribirLegajoDoc($con, $dni, $legajo, $carrera, $fecha)
{
    $legajoAgregado = $con->query("INSERT INTO `legajo_docente` (`DNI`, `LEGAJO_DOC`, `CARRERA`, `FECHA_INSCRIPCION`)
                                            VALUES ($dni, '$legajo', $carrera, '$fecha');");

    return $legajoAgregado === false ? false : true;
}
?>
