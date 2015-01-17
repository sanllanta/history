
//funcion para elimiar campos fields
function remove_fields(link) {
    $(link).previous("input[type=hidden]").value = "1";
    $(link).up(".fields").hide();
}

$(document).ready(function(){
 $('select#category_2').chainedTo('select#category_1');
});
