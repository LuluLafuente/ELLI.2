// Esperar a que el documento esté listo
$(document).ready(function() {
    // Capturar el evento change del select de la carrera
    $('#carreraSelect').change(function() {
        // Filtrar las opciones de materia en función de la carrera seleccionada
        $('#materiaSelect option').each(function() {
            var carreraId = $(this).data('carrera');
            if ($('#carreraSelect').val() == 0 || carreraId == $('#carreraSelect').val()) {
                $(this).show();
            } else {
                $(this).hide();
            }
        }).change(); // <-- Esto activa el evento change al cargar la página

        // Reiniciar el select de materia para que aparezca el mensaje de selección
        $('#materiaSelect').val(0);
    });

    // Capturar el evento change del select de la materia
    $('#materiaSelect').change(function() {
        // Obtener el valor seleccionado de la materia
        var selectedMateria = $(this).val();

        // Hacer una petición AJAX al servidor para obtener los alumnos inscritos en la materia
        $.ajax({
            url: 'obtener_alumnos_inscritos.php', // Cambia 'obtener_alumnos_inscritos.php' por el archivo PHP que realizará la consulta
            method: 'POST',
            data: { materiaId: selectedMateria },
            dataType: 'json',
            success: function(response) {
                // Limpiar el select de alumnos
                $('#alumnoSelect').empty();

                // Agregar la opción para seleccionar un alumno
                $('#alumnoSelect').append('<option value="0" selected disabled>&gt; SELECCIONE UN ALUMNO &lt;</option>');

                // Agregar las opciones de alumnos obtenidas de la consulta
                for (var i = 0; i < response.length; i++) {
                    var alumnoId = response[i].id_alumno;
                    var alumnoNombre = response[i].nombre_alumno;
                    $('#alumnoSelect').append('<option value="' + alumnoId + '">' + alumnoNombre + '</option>');
                }
            },
            error: function(xhr, status, error) {
                // Manejar el error si es necesario
                console.log('Error al obtener los alumnos inscritos:', error);
                console.log('selectedMateria');
            }
        });
    });
});