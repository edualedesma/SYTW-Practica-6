// Cuando se pulsa la tecla INTRO, se llama a '/send'
$('#text').keypress(
  function(e){
    if( e.keyCode==13 ){
      $.get('/send',{text:$('#text').val()});
      $('#text').val('');
    } 
  }
);

(function() {
  var last = 0;
  setInterval(
    function(){
      $.get('/update',{last:last},
        function(response){
          last = $('<p>').html(response).find('span').data('last');
          $('#chat').append(response);
        }
      );

      $.get('/pedirusuarios',{last:last},
        function(response){
          $("#usuarios").html("");
          $('#usuarios').html(response);
        }
      );

    },
  1000);
})();

