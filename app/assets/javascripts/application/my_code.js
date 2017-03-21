//show and hide flash messages from DeviseHelper
window.setTimeout(function() {
  $(".alert").addClass("in");
}, 500);


window.setTimeout(function() {
  $(".alert").alert('close');
}, 3500);

$(document).ready(function(){
  //preven enter chars in input form in the Cart_Page
  input_fields = document.getElementsByClassName('input_book_count');
  for (field of input_fields) {
    field.onkeypress = function (e) {
      return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));  
    };
  };

  //buttons events in Book_Show_Pages
  button_plus = document.getElementsByName('button_plus')[0];
  button_minus = document.getElementsByName('button_minus')[0];
  if (button_plus) {
    button_plus.onclick = function (e) {
      input_fields[0].value = input_fields[0].value - 0 + 1
    }; 
  }
  if (button_minus) {
    button_minus.onclick = function (e) {
      if (input_fields[0].value  > 0) input_fields[0].value -= 1;
    };
  }
  // ReadMore information on press in the Book_Show_Page
  if ($("a[href='#Readmore']")) {
    $('#long_descr').toggle(0);
    $("a[href='#Readmore']").click(function(){
      $('#short_descr').toggle(0);
      $('#long_descr').toggle(0);
      if ($('#long_descr')[0].style['display'] == 'none') {
        $("a[href='#Readmore']").text('Read More')
      } else {
        $("a[href='#Readmore']").text('Hide Info')
      }
    })
  }

});//document_ready


 