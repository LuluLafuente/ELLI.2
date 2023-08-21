 //Filtrar Alumnos
document.addEventListener("DOMContentLoaded", function() {
    const materiaSelect = document.getElementById("materiaSelect");
    const tablaAlumnos = document.querySelector(".tabla-alumnos");

    // Función para mostrar u ocultar la tabla de alumnos según la materia seleccionada
function mostrarTablaAlumnos() {
const selectedMateriaId = materiaSelect.value;
const rows = tablaAlumnos.querySelectorAll("tr");

rows.forEach(row => {
const materiaId = row.getAttribute("data-materia");
const notaInput = row.querySelector("input[name^='nota[']");

if (materiaId === selectedMateriaId || selectedMateriaId === "0") {
    row.style.display = "table-row";
    notaInput.disabled = false;
} else {
    row.style.display = "none";
    notaInput.disabled = true;
}
});
}

    // Asignar evento al cambio de selección de materia
    materiaSelect.addEventListener("change", mostrarTablaAlumnos);

    // Inicialmente mostrar todos los alumnos
    mostrarTablaAlumnos();
});