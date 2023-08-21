 // Obtener referencias a los elementos select
 const materiaSelect = document.getElementById('materiaSelect');
 const notasTable = document.getElementById('notasTable');
 const tablaNotas = notasTable.querySelector('.tabla-notas');

 // Agregar event listeners a los selects
 materiaSelect.addEventListener('change', applyFilters);

 function applyFilters() {
     const selectedMateria = materiaSelect.value;

     // Recorrer las filas de la tabla y mostrar/ocultar según los filtros
     for (const row of tablaNotas.querySelectorAll('tr')) {
         const materia = row.getAttribute('data-materia');

         const materiaMatch = selectedMateria === '0' || materia === selectedMateria;

         // Mostrar la fila si ambos filtros coinciden, o si ambos filtros están en su valor predeterminado
         if (materiaMatch) {
             row.style.display = 'table-row';
         } else {
             row.style.display = 'none';
         }
     }
 }