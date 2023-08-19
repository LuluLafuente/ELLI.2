// DECLARANDO LAS VARIABLES
let fecha = new Date();
let fechaDia = fecha.getDate();
let fechaMes = fecha.getMonth();
let fechaAnio = fecha.getFullYear();

// RECUPERANDO LOS ELEMENTOS CONTENEDORES
let rol = document.getElementById("rol");
let carrera = document.getElementById("carrera");
let anio = document.getElementById("anio");
let legajo = document.getElementById("legajo");

// AGREGAR LAS FUNCIONES A LOS CONTENEDORES
anio.onblur = legajoFinal;
carrera.onchange = legajoFinal;

// FUNCIONES DE CAMPOS
// LA FUNCION ASIGNA EL LEGAJO TENTATIVO DEL ALUMNO
function legajoFinal(){
    legajo.value = legajoCarrera() + "-" + legajoAnio() + "-" + legajoNro() + "-" + legajoRol();
}

// LA FUNCION ASIGNA LA FECHA DE INSCRIPCION
function legajoAnio(){
    let asignarAnio = 0;

    if(anio.value === ""){
        asignarAnio = 0;
    }
    else if(anio.value >= 2000 && anio.value <= 3000){
        asignarAnio = anio.value - 2000;
    }
    else{
        asignarAnio = fechaAnio - 2000;
    }

    return asignarAnio;
}

// LA FUNCION ASIGNA LA ABREVIATURA DE LA CARRERA
function legajoCarrera(){
    let asignarCarrera = 0;
    let nroCarrera = parseInt(carrera.value);

    switch (nroCarrera) {
        case 1:
            asignarCarrera = "TSDS";
            break;

        case 2:
            asignarCarrera = "TSB";
            break;

        case 3:
            asignarCarrera = "TSGA";
            break;

        case 4:
            asignarCarrera = "TSARI";
            break;
    
        default:
            if(carrera == 0)
                alert("Debe elejir una carrera");
            break;
    }

    return asignarCarrera;
}

function legajoNro(){
    return "002";
}

// LA FUNCION ASIGNA EL ROL PARA EL LEJAJO
function legajoRol(){
    let asignarRol = "";

    switch (rol.value) {
        case "Alumno":
            asignarRol = "AL";
            break;

        case "Administrativo":
            asignarRol = "AD";
            break;

        case "Docente":
            asignarRol = "DC";
            break;
    
        default:
            break;
    }

    return asignarRol;
}
// Obtener el elemento del área de arrastre
const dropArea = document.getElementById('dropArea');

// Agregar listeners de eventos para arrastrar y soltar
dropArea.addEventListener('dragover', handleDragOver);
dropArea.addEventListener('dragleave', handleDragLeave);
dropArea.addEventListener('drop', handleDrop);

// Función para manejar el evento de arrastre sobre el área
function handleDragOver(event) {
  event.preventDefault(); // Prevenir el comportamiento predeterminado del navegador
  dropArea.classList.add('drag-over'); // Agregar clase para resaltar el área
}

// Función para manejar el evento de salida del área de arrastre
function handleDragLeave(event) {
  event.preventDefault(); // Prevenir el comportamiento predeterminado del navegador
  dropArea.classList.remove('drag-over'); // Remover clase de resaltado
}

// Función para manejar el evento de soltar en el área
function handleDrop(event) {
  event.preventDefault(); // Prevenir el comportamiento predeterminado del navegador
  dropArea.classList.remove('drag-over'); // Remover clase de resaltado
  const fotoFile = event.dataTransfer.files[0]; // Obtener el archivo de la transferencia

  // Verificar si el archivo es una imagen
  if (fotoFile.type.startsWith('image/')) {
    cargarFoto(fotoFile); // Llamar a la función para cargar la imagen
  } else {
    alert('Por favor, selecciona un archivo de imagen.'); // Mostrar alerta si no es una imagen
  }
}

// Función para cargar la foto desde el input de archivo
function cargarFotoDesdeInput() {
  const fotoFile = document.getElementById('foto').files[0]; // Obtener el archivo del input
  cargarFoto(fotoFile); // Llamar a la función para cargar la imagen
}

// Función para cargar y mostrar la imagen
function cargarFoto(fotoFile) {
  if (fotoFile) {
    const reader = new FileReader();
    reader.onload = function(event) {
      const fotoUrl = event.target.result;

      // Crear elementos para mostrar la imagen y el nombre del alumno
      const alumnoDiv = document.createElement('div');
     
  
      const alumnoImg = document.createElement('img');
      alumnoImg.src = fotoUrl;
  
      const alumnoNombre = document.createElement('p');
  
      // Agregar elementos al contenedor de alumnos
      alumnoDiv.appendChild(alumnoImg);
  
      const alumnosContainer = document.getElementById('alumnosContainer');
      alumnosContainer.appendChild(alumnoDiv);
  
      // Limpiar campos de nombre y foto
      document.getElementById('foto').value = '';
    };
  
    reader.readAsDataURL(fotoFile); // Leer el archivo como URL de datos
  } else {
    alert('Por favor, selecciona una foto.');
  }
}

// Función para agregar un alumno al hacer clic en el botón
function agregarFoto() {
  cargarFotoDesdeInput();
}
