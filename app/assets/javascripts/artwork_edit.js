//funcion para elimiar campos fields
function remove_fields(link) {
    $(link).previous("input[type=hidden]").value = "1";
    $(link).up(".fields").hide();
}

var ready;
ready = function(){
 $('select#category_2').chainedTo('select#category_1');
 $('select#category_3').chainedTo('select#category_2');
};
$(document).ready(ready);
$(document).on('page:load', ready);