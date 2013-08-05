
$(document).ready(function() {
  var loadingTimer;

  eRoute = crossroads.addRoute('#!/events/{id}', function(id) {
    $.fancybox('/events/' + id, {
      type:'ajax', 
      fixed:true,
      afterLoad:function() {
        _gaq.push(['_trackPageview', document.location.href]);
      },
      afterClose:function() {
        history.replaceState(null, '', '/');
      }
    })
  });

  $('a.e-sesamo').click(function(e){
    e.preventDefault();
    console.log('replaceState');
    history.replaceState(null, '', $(this).attr('href'));
    console.log('parse');
    crossroads.parse($(this).attr('href'));
  });


  $.ajaxSetup({
    cache: true
  });

  $(document).on('ajax:beforeSend', 'a.nav-links', function(){ 
    loadingTimer = setTimeout(function() { 
      $('#spinner').fadeIn('fast');
    }, 500);
  });

  $(document).ajaxComplete(function(){ 
    clearTimeout(loadingTimer);
    $('#spinner').fadeOut('fast');
    //applyDraggable();
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

  //applyDraggable();
  $('.mediaTable').mediaTable();

  if (history && history.pushState) {
    $(document).on('click', '#right-arrow, #left-arrow', function(){ 
      //console.log('clicked')
      history.pushState(null, '', this.href);
    });

    $(window).on('popstate', function() {
      //console.log('fired');
      $.getScript(location.href);
    });
  }
});
