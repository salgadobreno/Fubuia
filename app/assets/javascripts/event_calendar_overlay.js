jQuery(document).ready(function($) {
// not good..
  //$(".ec-event-bg").hover(function(){
  //  event_id = $(this).attr("data-event-id");
  //  event_class_name = $(this).attr("data-event-class");
  //  rowPos = $(".ec-"+event_class_name+"-"+event_id).offset();
  //  xTop = rowPos.top;
  //  xLeft = rowPos.left;
  //  $(".ec-"+event_class_name+"-"+event_id).clone().css({position:'absolute',left:xLeft,top:xTop}).addClass("clone").appendTo($('body'));
  //},function(){
  //  event_id = $(this).attr("data-event-id");
  //  event_class_name = $(this).attr("data-event-class");
  //  $(".ec-"+event_class_name+"-"+event_id+".clone").remove();
  //});

  // gotta unbind each time for trying
//    $(".ec-event.clone > a").live({ mouseout:function(event){event.preventDefault} });
//  $('.ec-event-bg').parent('.ec-event-cell').hover(function(){
//    obj = $(this).find(">:first-child");
//    rowPos = obj.offset();
//    xTop = rowPos.top;
//    xLeft = rowPos.left;
//    event_id = obj.attr("data-event-id");
//    event_class_name = obj.attr("data-event-class");
//    $(".ec-"+event_class_name+"-"+event_id).clone().css({position:'absolute',left:xLeft,top:xTop,display:'none'}).addClass("clone").appendTo($('body')).fadeToggle();
//  }, function(){
//    $(this).unbind("mouseenter mouseleave");
//    $(this).find(">a").unbind("mouseleave");
//
//    obj = $(this).find(">:first-child");
//    event_id = obj.attr("data-event-id");
//    event_class_name = obj.attr("data-event-class");
//
//    $(".ec-"+event_class_name+"-"+event_id+".clone").live({mouseout:function(){ $(this).fadeOut() }});
//
//    $(this).live({mouseover:function() {
//      $(".ec-"+event_class_name+"-"+event_id+".clone").fadeIn();
//    }});
//  })
    //var obj = $(this).find(">:first-child");
    //event_id = $(this).attr("data-event-id");
    //event_class_name = $(this).attr("data-event-class");
    //$(".ec-"+event_class_name+"-"+event_id+".clone").hide();
    //$(this).unbind("mouseenter mouseleave");
    //$(this).hover(function(){
    //  alert("mi");
    //});

});
