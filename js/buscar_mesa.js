$(document).ready(function () {
    $('#materiaSelect').change(function () {
        var selectedMateria = $(this).val();
        $('.tabla-mesas tr').each(function () {
            var rowMateria = $(this).data('materia');
            if (rowMateria === selectedMateria || selectedMateria === '0') {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});