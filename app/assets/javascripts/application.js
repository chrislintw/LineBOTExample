// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


// $("form#send_text_form input[type=submit]").on('click',function(event) {
//   /* Act on the event */
//   // $.ajax({
//   //   url: $(this).attr('action'),
//   //   type: 'POST',
//   //   dataType: 'JSON',
//   //   data: $(this).serialize(),
//   // })
//   // .done(function() {
//     console.log('ok');
//     $('table.messages tbody').append('<tr><td class="text-right">'+ text+'</td></tr>');
//     document.getElementById("send_text_form").reset();
//   // })
//   // .fail(function() {
//   //   console.log("error");
//   // })
//   // .always(function() {
//   //   console.log("complete");
//   // });

//   return false;
// });



$("form#send_text_form").on('ajax:success', function(event, data, status, xhr) {
  console.log(data["status"]);
  $('table.messages tbody').append('<tr><td class="text-right">'+ data["text"]+'</td></tr>');
  document.getElementById("send_text_form").reset();
}).on("ajax:error", function(e, data, status, xhr){
  console.log(e,status,data);
});