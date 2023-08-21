//Buscar Mesa
document.addEventListener("DOMContentLoaded", function () {
    const carreraSelect = document.getElementById("carreraSelect");
    const materiaSelect = document.getElementById("materiaSelect");
    const tablaMesas = document.querySelector(".tabla-mesas");

    // Copia de seguridad de todas las filas de mesas
    const todasLasFilas = Array.from(tablaMesas.querySelectorAll("tr"));

    // Evento para filtrar las materias por carrera
    carreraSelect.addEventListener("change", function () {
        const carreraSeleccionada = carreraSelect.value;

        // Filtrar las opciones de materia en función de la carrera
        const opcionesMateria = Array.from(materiaSelect.options);
        opcionesMateria.forEach(opcion => {
            const carreraData = opcion.getAttribute("data-carrera");
            if (carreraSeleccionada === "0" || carreraSeleccionada === carreraData) {
                opcion.style.display = "block";
            } else {
                opcion.style.display = "none";
            }
        });

        // Restablecer el valor de materia
        materiaSelect.value = "0";

        // Restaurar todas las filas de mesas
        tablaMesas.innerHTML = "";
        todasLasFilas.forEach(fila => tablaMesas.appendChild(fila));
    });

    // Evento para mostrar las mesas relacionadas con la materia elegida
    materiaSelect.addEventListener("change", function () {
        const materiaSeleccionada = materiaSelect.value;

        // Filtrar y mostrar solo las filas de mesas relacionadas con la materia
        const filas = todasLasFilas.filter(fila => fila.getAttribute("data-materia") === materiaSeleccionada);
        tablaMesas.innerHTML = "";
        filas.forEach(fila => tablaMesas.appendChild(fila));
    });
});
