
$(document).ready(function() {
  var loadingTimer, popped;
  popped = false;

  crossroads.addRoute('#!/events/{id}', function(id) {
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

  $('#calendar').on("click", 'a.e-sesamo', function(e){
    console.log('replaceState');
    history.replaceState(null, '', $(this).attr('href'));
    console.log('parse');
    crossroads.parse($(this).attr('href'));
    e.preventDefault();
  });


  $.ajaxSetup({
    cache: true
  });

  $(document).on('ajax:beforeSend', 'a.nav-links', function(){ 
    loadingTimer = setTimeout(function() { 
      $('#spinner').fadeIn('fast');
    }, 100);
  });

  $(document).ajaxComplete(function(){ 
    clearTimeout(loadingTimer);
    $('#spinner').fadeOut('fast');
    //applyDraggable();
  });

  $(document).on('keydown', function(e) {
    if (e.keyCode == 37) {
      $('#left-arrow').click() 
    }
  });
  $(document).on('keydown', function(e) { 
    if (e.keyCode == 39) {
      $('#right-arrow').click() 
    }
  });

  //applyDraggable();
  $('.mediaTable').mediaTable();

  if (history && history.pushState) {
    $('#calendar').on('click', '#right-arrow, #left-arrow', function(){ 
      //console.log('clicked')
      popped = true
      history.pushState(null, '', this.href);
    });

    $(window).on('popstate', function() {
      //console.log('fired');
      popped && $.getScript(location.href);
    });
  }
});
