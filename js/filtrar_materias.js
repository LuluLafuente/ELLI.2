$(document).ready(function () {
    // Capturar el evento change del select de la carrera
    $('#carreraSelect').change(function () {
        // Filtrar las opciones de materia en función de la carrera seleccionada
        $('#materiaSelect option').each(function () {
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
    $('#materiaSelect').change(function () {
        // Obtener el valor seleccionado de la materia
        var selectedMateria = $(this).val();

    });
});

