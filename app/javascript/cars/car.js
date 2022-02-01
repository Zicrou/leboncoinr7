import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery

function getIdMarque() {
    var marqueid = document.getElementById("car_marque_id").value
        //alert(marqueid)
    if (marqueid == "") {
        $("#car_modele_id").children().remove();
        var modeles = $('.modeles').data('modeles')
        var listmodele = [];
        $.each(modeles, function(key, value) {
            listmodele += '<option value="' + value.id + '">' + value.name + '</option>';
        });
        $("#car_modele_id").append(listmodele).prepend("<option value='' selected='selected'></option>");

    } else {
        $.ajax({
            url: "/cars/filter",
            type: "GET",
            data: { marqueId: marqueID },
            success: function(data) {
                $("#car_modele_id").children().remove();
                var listmodele = [];
                $.each(data, function(key, value) {
                    listmodele += '<option value="' + value.id + '">' + value.name + '</option>';
                });
                $("#car_modele_id").append(listmodele).prepend("<option value='' selected='selected'></option>");
            }
        });
    }
}
document.addEventListener("turbo:load", () => {
    getIdMarque()
})