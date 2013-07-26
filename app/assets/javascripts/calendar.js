//= require jquery-ui-1.10.3.custom.min.js
//= require jquery.ui.touch-punch.min.js
// TODO: revert only if not pulled enough
$(document).ready(function() {
  var loadingTimer;
  var drag_start, drag_stop;

  function applyDraggable() {
    $('.ec-body').draggable({
      axis:"x",
      distance:20,
      scroll:false,
      revert: true,
      start:function(event,ui) {
        drag_start = ui.position.left;
      },
      stop:function(event,ui) {
        drag_stop = ui.position.left;
        var moved = drag_start < drag_stop ? 0 : 1 // right : left
        var distance = drag_start - drag_stop;
        if (Math.abs(distance) >= 100) {
          if (moved == 0) {
            $('#left-arrow').click();
          } else if (moved == 1) {
            $('#right-arrow').click();
          }
        }
      },
    });
  }

  $(document).on('ajax:beforeSend', 'a.nav-links', function(){ 
    loadingTimer = setTimeout(function() { 
      $('#spinner').fadeIn('fast');
    }, 500);
  });

  $(document).ajaxComplete(function(){ 
    clearTimeout(loadingTimer);
    $('#spinner').fadeOut('fast');
    applyDraggable();
  });

  $(document).bind('keydown', function(e) {
    if (e.keyCode == 37) {
      $('#left-arrow').click() 
    }
  });
  $(document).bind('keydown', function(e) { 
    if (e.keyCode == 39) {
      $('#right-arrow').click() 
    }
  });

  applyDraggable();
  $('.mediaTable').mediaTable();
});
