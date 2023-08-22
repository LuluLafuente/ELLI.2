<?php

//INICIO SESION
session_start();

//REVISO QUE HAYA UNA SESION ACTIVA DE USUARIO,
//DE LO CONTRARIO VUELVE A LA PAGINA DE INICIO.
if(!isset($_SESSION["usuario"])){
    //header("location:index.html");
    //echo "Verdadero </br>";
}

//AGREGO LAS FUNCIONES NECESARIAS PARA EL FUNCIONAMIENTO DE LA CARGA DE ALUMNOS
include 'bd_conexion.php';
include 'bd_select.php';
require 'fpdf.php';

class PDF extends FPDF
{
    private $cert = "";
    // Cabecera de página
    function Header()
    {
        // Logo
        $this->Image('img/imagen-certificado-1.png',10,8,33);
        // Arial bold 15
        $this->SetFont('Times','B',15);
        // Movernos a la derecha
        $this->Cell(80);
        // Título
        $this->Cell(30,10,'Instituto Superior de Educacion Tecnologica',0,0,'C');
        // Salto de línea
        $this->Ln(20);
        // Movernos a la derecha
        $this->Cell(80);
        //
        switch ($this->cert) {
            case 0:
                $certif = "Alumno Regular";
                break;
            case 1:
                $certif = "Examen";
                break;
            case 2:
                $certif = "Materias Aprobadas";
                break;
            default:
                # code...
                break;
        }
        // Sub-título
        $this->Cell(30,10,'Certificado de ' . $certif,0,0,'C');
        // Salto de línea
        $this->Ln(20);
    }

    // Texto primera parte
    function constanciaRegularP1($text, $cod)
    {
        // Times 12
        $this->SetFont('Times','',12);
        // Imprimimos el texto justificado
        $this->MultiCell(0,5,$text);
        
        // Imprimimos el codigo de validacion        
        $this->codigoValidacion($cod);
    }

    function codigoValidacion($cod){
        // Salto de línea
        $this->Ln();
        $this->Cell(75);
        // Titulo codigo
        $this->Cell(80, 0, "Codigo de validacion");
        // Salto de línea
        $this->Ln();
        // Movernos a la derecha
        $this->Cell(80);
        // Imagen
        $this->Image('img/imagen-certificado-2.png',$this->x - 11, $this->y + 5, 54);
        // Salto de línea
        $this->Ln(25);
        // Movernos a la derecha
        $this->Cell(62);
        // Código de validación
        $this->Cell(80, 0, ">$cod<");
    }

    // Texto segunda parte
    function constanciaRegularP2($text)
    {
        // Times 12
        $this->SetFont('Times','',12);
        // Salto de línea
        $this->Ln(5);
        // Imprimimos el texto justificado
        $this->MultiCell(0,5,$text);
        // Salto de línea
        $this->Ln();
    }
    

    function constanciaExamenP1($text, $text2, $text3, $text4, $cod)
    {
        // Times 12
        $this->SetFont('Times','',12);
        // Imprimimos el texto justificado
        $this->MultiCell(0,5,$text);
        $this->Ln(1);

        $this->MultiCell(0,5,$text2);
        $this->Ln();

        $this->MultiCell(0,5,$text3);
        $this->Ln();

        $this->MultiCell(0,5,$text4);
        $this->Ln();

        // Imprimimos el codigo de validacion
        $this->codigoValidacion($cod);
    }

    // Texto segunda parte
    function constanciaExamenP2($text)
    {
        // Leemos el fichero
        $txt = $text;
        // Times 12
        $this->SetFont('Times','',12);
        // Salto de línea
        $this->Ln(5);
        // Imprimimos el texto justificado
        $this->MultiCell(0,5,$txt);
        // Salto de línea
        $this->Ln();
    }

    function constanciaMateriasP1($text, $cod)
    {
        // Times 12
        $this->SetFont('Times','',12);

        // Imprimimos el texto
        $this->MultiCell(0, 5, $text);

        // Salto de línea
        $this->Ln(1);

    }

    function constanciaMateriasP2($text)
    {
        // Times 12
        $this->SetFont('Times','',12);

        // Salto de línea
        $this->Ln(5);

        // Imprimimos el texto justificado
        $this->MultiCell(0,5,"LISTADO DE MATERIAS");

        // Salto de línea
        $this->Ln(1);

    }

    // Texto con observaciones
    function observaciones($text = "")
    {
        // Leemos el fichero
        $txt = $text;
        // Times 12
        $this->SetFont('Times','',12);
        // Salto de línea
        $this->Ln();
        // Imprimimos el texto
        $this->Cell(0, 0, "Observaciones:");
        // Salto de línea
        $this->Ln();
        // Imprimimos el texto justificado
        if(strlen($txt) == 0){
            $this->MultiCell(0,10,"-.");
        }
        else{
            $this->MultiCell(0,10,$txt);
        }
    }

    // Texto con observaciones
    function datosInstitucion($text)
    {
        // Leemos el fichero
        $txt = $text;
        // Times 12
        $this->SetFont('Times','',12);
        // Salto de línea
        $this->Ln();
        // Imprimitos el texto
        $this->MultiCell(0, 5,$txt);
    }

    // Pie de página
    function Footer()
    {
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
    }

    function setCert($cert){
        $this->cert = $cert;
    }

    function getCert(){
        return $this->cert;
    }
}

// Variables usadas
$certificadoTipo = $_POST['alumno-constancia'];


switch ($certificadoTipo) {
    case 0:
        $alumno = $_POST['alu'];
        $legajo = $_POST['leg'];
        $dni = $_POST["dni"];
        $carrera = $_POST["car"];
        $resolucion = $_POST["res"];
        $anioIngreso = $_POST["ing"];
        $interesado = $_POST["interesado"];

        if(strlen($interesado) == 0){
            $interesado = "quien corresponda";
        }
        
        break;

    case 1:
        $alumno = $_POST['alu'];
        $legajo = $_POST['leg'];
        $dni = $_POST["dni"];
        $carrera = $_POST["car"];
        $resolucion = $_POST["res"];
        $anioIngreso = $_POST["ing"];
        $interesado = $_POST["interesado"];
        $materia = $_POST["mat"];
        $fExamen = $_POST["fex"];

        if(strlen($interesado) == 0){
            $interesado = "quien corresponda";
        }

        break;
        
    case 2:
        $alumno = $_POST['alu'];
        $legajo = $_POST['leg'];
        $dni = $_POST["dni"];
        $carrera = $_POST["car"];
        $resolucion = $_POST["res"];
        $interesado = $_POST["interesado"];

        if(strlen($interesado) == 0){
            $interesado = "a quien corresponda";
        }
        
        break;
    
    default:
        # code...
        break;
}

// Fecha y hora Argentina
date_default_timezone_set('America/Argentina/Tucuman');
$dia = date('d');
$mesNro = date('m');
$anio = date('Y');
$hora = date('H');
$minuto = date('i');
$segundo = date('s');
$fechaCompleta = $dia . $mesNro . $anio . $hora . $minuto . $segundo;
$diasVigencia = $_POST["dvi"];
$observaciones = $_POST["observaciones"];

// Formación del código de validación
$codigo = $legajo . $fechaCompleta;

switch ($mesNro) {
    case '01':
        $mes ="Enero";
        break;

    case '02':
        $mes ="Febrero";
        break;

    case '03':
        $mes ="Marzo";
        break;

    case '04':
        $mes ="Abril";
        break;

    case '05':
        $mes ="Mayo";
        break;

    case '06':
        $mes ="Junio";
        break;

    case '07':
        $mes ="Julio";
        break;

    case '08':
        $mes ="Agosto";
        break;

    case '09':
        $mes ="Septiembre";
        break;

    case '10':
        $mes ="Octubre";
        break;

    case '11':
        $mes ="Noviembre";
        break;

    case '12':
        $mes ="Diciembre";
        break;
    
    default:
        $mes = "";
        break;
}

// Textos Constancias
switch ($certificadoTipo) {
    case 0:
        // Primer sección de la constancia
        $texto_1  = "El Instituto Superior de Educacion Tecnologica certifica que el alumno $alumno, ";
        $texto_1 .= "con legajo $legajo y dni $dni , actualmente se encuentra en condicion de regular ";
        $texto_1 .= "en la carrera $carrera con resolucion $resolucion habiendo ingresado en el año $anioIngreso.";
        $texto_1 .= "
        Se emite el presente certificado para ser presentado ante $interesado, se extiende ";
        $texto_1 .= "el mismo en la ciudad de San Miguel de Tucuman, a los $dia dias del mes de $mes de $anio.";

        // Segunda sección de la constancia
        $texto_2  = "El presente certificado puede ser validado en la pagina de la institucion ingresando el codigo ";
        $texto_2 .= "que se detalla arriba. El certificado cuenta con una vigencia de $diasVigencia dia/s a partir ";
        $texto_2 .= "de la fecha de emision del mismo.";

        $texto_3 = $observaciones . ".";
        break;

    case 1:
        // Primer sección de la constancia
        $texto_1  = "Por la presente, se hace constar que el alumno/a $alumno, con legajo $legajo ";
        $texto_1 .= "y dni $dni perteneciente la carrera $carrera con resolucion $resolucion, ha ";
        $texto_1 .= " sido otorgado el el permiso para presentar el siguiente examen:";

        $texto_2  = "
        Materia: $materia.";
        $texto_2 .= "
        Fecha del examen: $fExamen.";
        $texto_2 .= "
        Horario: 19 a 22 hs.";
        
        $texto_3  = "Este permiso ha sido otorgado de acuerdo con las regulaciones y procedimientos ";
        $texto_3 .= "establecidos por la institucion, y el estudiante ha cumplido con los requisitos ";
        $texto_3 .= "necesarios para la presentacion del examen en cuestion.";

        $texto_4  = "Se emite el presente certificado para ser presentado a $interesado, se extiende ";
        $texto_4 .= "el mismo en la ciudad de San Miguel de Tucuman, a los $dia dias del mes de $mes de $anio.";

        // Segunda sección de la constancia
        $texto_5  = "El presente certificado puede ser validado en la pagina de la institucion ingresando el codigo ";
        $texto_5 .= "que se detalla arriba. El certificado cuenta con una vigencia de $diasVigencia dia/s a partir ";
        $texto_5 .= "de la fecha de emision del mismo.";
        break;

    case 2:
        // Primer sección de la constancia
        $texto_1  = "Por la presente, se certifica que el alumno/a $alumno, con legajo $legajo ";
        $texto_1 .= "y dni $dni perteneciente la carrera $carrera con resolucion $resolucion, ha ";
        $texto_1 .= "aprobado satisfactoriamente las siguientes materias correspondientes al plan de estudios del ";
        $texto_1 .= "Instituto Superior de Educacion Tecnologica:";

        $texto_2  = "La calificacion obtenida en cada una de estas materias refleja el esfuerzo y el compromiso ";
        $texto_2 .= "del estudiante en su proceso de aprendizaje. Las notas han sido calculadas de acuerdo con ";
        $texto_2 .= "los criterios de evaluacion establecidos por la institucion.";
        
        $texto_3  = "Este permiso ha sido otorgado de acuerdo con las regulaciones y procedimientos ";
        $texto_3 .= "establecidos por la institucion, y el estudiante ha cumplido con los requisitos ";
        $texto_3 .= "necesarios para la presentacion del examen en cuestion.";

        $texto_4  = "Se emite el presente certificado para ser presentado ante $interesado, se extiende ";
        $texto_4 .= "el mismo en la ciudad de San Miguel de Tucuman, a los $dia dias del mes de $mes de $anio.";

        // Segunda sección de la constancia
        $texto_4  = "
        Se recuerda al estudiante la importancia de llegar puntualmente al lugar del examen y de ";
        $texto_4 .= "cumplir con las normas de conducta y etica durante el proceso de evaluacion.";
        $texto_4 .= "
        Esta constancia se emite a solicitud del interesado para los fines que considere pertinentes.";
        $texto_4 .= "Atentamente.
        
        [Nombre de la institución]
        [Teléfono de contacto]
        [Correo electrónico de contacto]";
        break;
    
    default:
        break;
}

// Texto del pie de pagina
$textoInstitución  = "Atentamente, Instituto Superior de Educacion Tecnologica.
";
$textoInstitución .= "Direccion: Domingo Garcia 47 - S. M. de Tucumán.
";
$textoInstitución .= "Telefono: 3814526310.
";
$textoInstitución .= "E-mail: correoiset@yahoo.com.ar
";
$textoInstitución .= "Web: iset.tuc.infd.edu.ar
";



// Creación del objeto de la clase heredada

switch ($certificadoTipo) {
    case 0:
        $pdf = new PDF();
        $pdf->setCert($certificadoTipo);
        $pdf->AliasNbPages();
        $pdf->AddPage();
        $pdf->SetFont('Times','',12);
        $pdf->constanciaRegularP1($texto_1, $codigo);
        $pdf->constanciaRegularP2($texto_2);
        $pdf->observaciones($texto_3);
        $pdf->datosInstitucion($textoInstitución);
        $pdf->Output();
        break;

    case 1:
        $pdf = new PDF();
        $pdf->setCert($certificadoTipo);
        $pdf->AliasNbPages();
        $pdf->AddPage();
        $pdf->SetFont('Times','',12);
        $pdf->constanciaExamenP1($texto_1, $texto_2, $texto_3, $texto_4, $codigo);
        $pdf->constanciaExamenP2($texto_5);
        $pdf->datosInstitucion($textoInstitución);
        $pdf->Output();
        break;

    case 2:
        $pdf = new PDF();
        $pdf->setCert($certificadoTipo);
        $pdf->AliasNbPages();
        $pdf->AddPage();
        $pdf->SetFont('Times','',12);
        $pdf->constanciaMateriasP1($texto_1, $codigo);
        $pdf->constanciaMateriasP2($texto_2);
        $pdf->datosInstitucion($textoInstitución);
        $pdf->Output();
        break;
    default:
        # code...
        break;
}
/*
$pdf = new PDF();
$pdf->setCert($certificadoTipo);
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);
$pdf->ChapterBodyWithImage($texto_1, $codigo);
$pdf->ChapterBody($texto_2);
$pdf->ChapterBodyObservation($texto_3);
//$pdf->Cell(0,10,$w,0,1);
//$pdf->Cell(0,20,$texto,0,1);
$pdf->Output();
*/

// REDIRECCIONO A CONSTANCIAS
//include('constancias.php');