
window.setTimeout(function() {
  $(".alert").addClass("in");
}, 500);


window.setTimeout(function() {
  $(".alert").alert('close');
}, 2500);

$(document).ready(function(){
  input_fields = document.getElementsByName('input_book_count');
  for (field of input_fields) {
    field.onkeypress = function (e) {
      return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));  
    };

    field.onkeyup = function (e) {
      console.log('recalculate value ...')
      ttt = $(this).closest("table");
      console.log(ttt);
    }; 
  };

});//document_ready


 