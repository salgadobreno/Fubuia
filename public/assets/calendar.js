/*! jQuery UI - v1.10.3 - 2013-07-21
* http://jqueryui.com
* Includes: jquery.ui.core.js, jquery.ui.widget.js, jquery.ui.mouse.js, jquery.ui.draggable.js
* Copyright 2013 jQuery Foundation and other contributors Licensed MIT */
!function(e,t){function n(t,n){var o,r,s,a=t.nodeName.toLowerCase();return"area"===a?(o=t.parentNode,r=o.name,t.href&&r&&"map"===o.nodeName.toLowerCase()?(s=e("img[usemap=#"+r+"]")[0],!!s&&i(s)):!1):(/input|select|textarea|button|object/.test(a)?!t.disabled:"a"===a?t.href||n:n)&&i(t)}function i(t){return e.expr.filters.visible(t)&&!e(t).parents().addBack().filter(function(){return"hidden"===e.css(this,"visibility")}).length}var o=0,r=/^ui-id-\d+$/;e.ui=e.ui||{},e.extend(e.ui,{version:"1.10.3",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),e.fn.extend({focus:function(t){return function(n,i){return"number"==typeof n?this.each(function(){var t=this;setTimeout(function(){e(t).focus(),i&&i.call(t)},n)}):t.apply(this,arguments)}}(e.fn.focus),scrollParent:function(){var t;return t=e.ui.ie&&/(static|relative)/.test(this.css("position"))||/absolute/.test(this.css("position"))?this.parents().filter(function(){return/(relative|absolute|fixed)/.test(e.css(this,"position"))&&/(auto|scroll)/.test(e.css(this,"overflow")+e.css(this,"overflow-y")+e.css(this,"overflow-x"))}).eq(0):this.parents().filter(function(){return/(auto|scroll)/.test(e.css(this,"overflow")+e.css(this,"overflow-y")+e.css(this,"overflow-x"))}).eq(0),/fixed/.test(this.css("position"))||!t.length?e(document):t},zIndex:function(n){if(n!==t)return this.css("zIndex",n);if(this.length)for(var i,o,r=e(this[0]);r.length&&r[0]!==document;){if(i=r.css("position"),("absolute"===i||"relative"===i||"fixed"===i)&&(o=parseInt(r.css("zIndex"),10),!isNaN(o)&&0!==o))return o;r=r.parent()}return 0},uniqueId:function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++o)})},removeUniqueId:function(){return this.each(function(){r.test(this.id)&&e(this).removeAttr("id")})}}),e.extend(e.expr[":"],{data:e.expr.createPseudo?e.expr.createPseudo(function(t){return function(n){return!!e.data(n,t)}}):function(t,n,i){return!!e.data(t,i[3])},focusable:function(t){return n(t,!isNaN(e.attr(t,"tabindex")))},tabbable:function(t){var i=e.attr(t,"tabindex"),o=isNaN(i);return(o||i>=0)&&n(t,!o)}}),e("<a>").outerWidth(1).jquery||e.each(["Width","Height"],function(n,i){function o(t,n,i,o){return e.each(r,function(){n-=parseFloat(e.css(t,"padding"+this))||0,i&&(n-=parseFloat(e.css(t,"border"+this+"Width"))||0),o&&(n-=parseFloat(e.css(t,"margin"+this))||0)}),n}var r="Width"===i?["Left","Right"]:["Top","Bottom"],s=i.toLowerCase(),a={innerWidth:e.fn.innerWidth,innerHeight:e.fn.innerHeight,outerWidth:e.fn.outerWidth,outerHeight:e.fn.outerHeight};e.fn["inner"+i]=function(n){return n===t?a["inner"+i].call(this):this.each(function(){e(this).css(s,o(this,n)+"px")})},e.fn["outer"+i]=function(t,n){return"number"!=typeof t?a["outer"+i].call(this,t):this.each(function(){e(this).css(s,o(this,t,!0,n)+"px")})}}),e.fn.addBack||(e.fn.addBack=function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}),e("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(e.fn.removeData=function(t){return function(n){return arguments.length?t.call(this,e.camelCase(n)):t.call(this)}}(e.fn.removeData)),e.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),e.support.selectstart="onselectstart"in document.createElement("div"),e.fn.extend({disableSelection:function(){return this.bind((e.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(e){e.preventDefault()})},enableSelection:function(){return this.unbind(".ui-disableSelection")}}),e.extend(e.ui,{plugin:{add:function(t,n,i){var o,r=e.ui[t].prototype;for(o in i)r.plugins[o]=r.plugins[o]||[],r.plugins[o].push([n,i[o]])},call:function(e,t,n){var i,o=e.plugins[t];if(o&&e.element[0].parentNode&&11!==e.element[0].parentNode.nodeType)for(i=0;o.length>i;i++)e.options[o[i][0]]&&o[i][1].apply(e.element,n)}},hasScroll:function(t,n){if("hidden"===e(t).css("overflow"))return!1;var i=n&&"left"===n?"scrollLeft":"scrollTop",o=!1;return t[i]>0?!0:(t[i]=1,o=t[i]>0,t[i]=0,o)}})}(jQuery),function(e,t){var n=0,i=Array.prototype.slice,o=e.cleanData;e.cleanData=function(t){for(var n,i=0;null!=(n=t[i]);i++)try{e(n).triggerHandler("remove")}catch(r){}o(t)},e.widget=function(n,i,o){var r,s,a,l,c={},u=n.split(".")[0];n=n.split(".")[1],r=u+"-"+n,o||(o=i,i=e.Widget),e.expr[":"][r.toLowerCase()]=function(t){return!!e.data(t,r)},e[u]=e[u]||{},s=e[u][n],a=e[u][n]=function(e,n){return this._createWidget?(arguments.length&&this._createWidget(e,n),t):new a(e,n)},e.extend(a,s,{version:o.version,_proto:e.extend({},o),_childConstructors:[]}),l=new i,l.options=e.widget.extend({},l.options),e.each(o,function(n,o){return e.isFunction(o)?(c[n]=function(){var e=function(){return i.prototype[n].apply(this,arguments)},t=function(e){return i.prototype[n].apply(this,e)};return function(){var n,i=this._super,r=this._superApply;return this._super=e,this._superApply=t,n=o.apply(this,arguments),this._super=i,this._superApply=r,n}}(),t):(c[n]=o,t)}),a.prototype=e.widget.extend(l,{widgetEventPrefix:s?l.widgetEventPrefix:n},c,{constructor:a,namespace:u,widgetName:n,widgetFullName:r}),s?(e.each(s._childConstructors,function(t,n){var i=n.prototype;e.widget(i.namespace+"."+i.widgetName,a,n._proto)}),delete s._childConstructors):i._childConstructors.push(a),e.widget.bridge(n,a)},e.widget.extend=function(n){for(var o,r,s=i.call(arguments,1),a=0,l=s.length;l>a;a++)for(o in s[a])r=s[a][o],s[a].hasOwnProperty(o)&&r!==t&&(n[o]=e.isPlainObject(r)?e.isPlainObject(n[o])?e.widget.extend({},n[o],r):e.widget.extend({},r):r);return n},e.widget.bridge=function(n,o){var r=o.prototype.widgetFullName||n;e.fn[n]=function(s){var a="string"==typeof s,l=i.call(arguments,1),c=this;return s=!a&&l.length?e.widget.extend.apply(null,[s].concat(l)):s,a?this.each(function(){var i,o=e.data(this,r);return o?e.isFunction(o[s])&&"_"!==s.charAt(0)?(i=o[s].apply(o,l),i!==o&&i!==t?(c=i&&i.jquery?c.pushStack(i.get()):i,!1):t):e.error("no such method '"+s+"' for "+n+" widget instance"):e.error("cannot call methods on "+n+" prior to initialization; "+"attempted to call method '"+s+"'")}):this.each(function(){var t=e.data(this,r);t?t.option(s||{})._init():e.data(this,r,new o(s,this))}),c}},e.Widget=function(){},e.Widget._childConstructors=[],e.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(t,i){i=e(i||this.defaultElement||this)[0],this.element=e(i),this.uuid=n++,this.eventNamespace="."+this.widgetName+this.uuid,this.options=e.widget.extend({},this.options,this._getCreateOptions(),t),this.bindings=e(),this.hoverable=e(),this.focusable=e(),i!==this&&(e.data(i,this.widgetFullName,this),this._on(!0,this.element,{remove:function(e){e.target===i&&this.destroy()}}),this.document=e(i.style?i.ownerDocument:i.document||i),this.window=e(this.document[0].defaultView||this.document[0].parentWindow)),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:e.noop,_getCreateEventData:e.noop,_create:e.noop,_init:e.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(e.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled "+"ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:e.noop,widget:function(){return this.element},option:function(n,i){var o,r,s,a=n;if(0===arguments.length)return e.widget.extend({},this.options);if("string"==typeof n)if(a={},o=n.split("."),n=o.shift(),o.length){for(r=a[n]=e.widget.extend({},this.options[n]),s=0;o.length-1>s;s++)r[o[s]]=r[o[s]]||{},r=r[o[s]];if(n=o.pop(),i===t)return r[n]===t?null:r[n];r[n]=i}else{if(i===t)return this.options[n]===t?null:this.options[n];a[n]=i}return this._setOptions(a),this},_setOptions:function(e){var t;for(t in e)this._setOption(t,e[t]);return this},_setOption:function(e,t){return this.options[e]=t,"disabled"===e&&(this.widget().toggleClass(this.widgetFullName+"-disabled ui-state-disabled",!!t).attr("aria-disabled",t),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")),this},enable:function(){return this._setOption("disabled",!1)},disable:function(){return this._setOption("disabled",!0)},_on:function(n,i,o){var r,s=this;"boolean"!=typeof n&&(o=i,i=n,n=!1),o?(i=r=e(i),this.bindings=this.bindings.add(i)):(o=i,i=this.element,r=this.widget()),e.each(o,function(o,a){function l(){return n||s.options.disabled!==!0&&!e(this).hasClass("ui-state-disabled")?("string"==typeof a?s[a]:a).apply(s,arguments):t}"string"!=typeof a&&(l.guid=a.guid=a.guid||l.guid||e.guid++);var c=o.match(/^(\w+)\s*(.*)$/),u=c[1]+s.eventNamespace,p=c[2];p?r.delegate(p,u,l):i.bind(u,l)})},_off:function(e,t){t=(t||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,e.unbind(t).undelegate(t)},_delay:function(e,t){function n(){return("string"==typeof e?i[e]:e).apply(i,arguments)}var i=this;return setTimeout(n,t||0)},_hoverable:function(t){this.hoverable=this.hoverable.add(t),this._on(t,{mouseenter:function(t){e(t.currentTarget).addClass("ui-state-hover")},mouseleave:function(t){e(t.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(t){this.focusable=this.focusable.add(t),this._on(t,{focusin:function(t){e(t.currentTarget).addClass("ui-state-focus")},focusout:function(t){e(t.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(t,n,i){var o,r,s=this.options[t];if(i=i||{},n=e.Event(n),n.type=(t===this.widgetEventPrefix?t:this.widgetEventPrefix+t).toLowerCase(),n.target=this.element[0],r=n.originalEvent)for(o in r)o in n||(n[o]=r[o]);return this.element.trigger(n,i),!(e.isFunction(s)&&s.apply(this.element[0],[n].concat(i))===!1||n.isDefaultPrevented())}},e.each({show:"fadeIn",hide:"fadeOut"},function(t,n){e.Widget.prototype["_"+t]=function(i,o,r){"string"==typeof o&&(o={effect:o});var s,a=o?o===!0||"number"==typeof o?n:o.effect||n:t;o=o||{},"number"==typeof o&&(o={duration:o}),s=!e.isEmptyObject(o),o.complete=r,o.delay&&i.delay(o.delay),s&&e.effects&&e.effects.effect[a]?i[t](o):a!==t&&i[a]?i[a](o.duration,o.easing,r):i.queue(function(n){e(this)[t](),r&&r.call(i[0]),n()})}})}(jQuery),function(e){var t=!1;e(document).mouseup(function(){t=!1}),e.widget("ui.mouse",{version:"1.10.3",options:{cancel:"input,textarea,button,select,option",distance:1,delay:0},_mouseInit:function(){var t=this;this.element.bind("mousedown."+this.widgetName,function(e){return t._mouseDown(e)}).bind("click."+this.widgetName,function(n){return!0===e.data(n.target,t.widgetName+".preventClickEvent")?(e.removeData(n.target,t.widgetName+".preventClickEvent"),n.stopImmediatePropagation(),!1):void 0}),this.started=!1},_mouseDestroy:function(){this.element.unbind("."+this.widgetName),this._mouseMoveDelegate&&e(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(n){if(!t){this._mouseStarted&&this._mouseUp(n),this._mouseDownEvent=n;var i=this,o=1===n.which,r="string"==typeof this.options.cancel&&n.target.nodeName?e(n.target).closest(this.options.cancel).length:!1;return o&&!r&&this._mouseCapture(n)?(this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){i.mouseDelayMet=!0},this.options.delay)),this._mouseDistanceMet(n)&&this._mouseDelayMet(n)&&(this._mouseStarted=this._mouseStart(n)!==!1,!this._mouseStarted)?(n.preventDefault(),!0):(!0===e.data(n.target,this.widgetName+".preventClickEvent")&&e.removeData(n.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(e){return i._mouseMove(e)},this._mouseUpDelegate=function(e){return i._mouseUp(e)},e(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate),n.preventDefault(),t=!0,!0)):!0}},_mouseMove:function(t){return e.ui.ie&&(!document.documentMode||9>document.documentMode)&&!t.button?this._mouseUp(t):this._mouseStarted?(this._mouseDrag(t),t.preventDefault()):(this._mouseDistanceMet(t)&&this._mouseDelayMet(t)&&(this._mouseStarted=this._mouseStart(this._mouseDownEvent,t)!==!1,this._mouseStarted?this._mouseDrag(t):this._mouseUp(t)),!this._mouseStarted)},_mouseUp:function(t){return e(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,t.target===this._mouseDownEvent.target&&e.data(t.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(t)),!1},_mouseDistanceMet:function(e){return Math.max(Math.abs(this._mouseDownEvent.pageX-e.pageX),Math.abs(this._mouseDownEvent.pageY-e.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return!0}})}(jQuery),function(e){e.widget("ui.draggable",e.ui.mouse,{version:"1.10.3",widgetEventPrefix:"drag",options:{addClasses:!0,appendTo:"parent",axis:!1,connectToSortable:!1,containment:!1,cursor:"auto",cursorAt:!1,grid:!1,handle:!1,helper:"original",iframeFix:!1,opacity:!1,refreshPositions:!1,revert:!1,revertDuration:500,scope:"default",scroll:!0,scrollSensitivity:20,scrollSpeed:20,snap:!1,snapMode:"both",snapTolerance:20,stack:!1,zIndex:!1,drag:null,start:null,stop:null},_create:function(){"original"!==this.options.helper||/^(?:r|a|f)/.test(this.element.css("position"))||(this.element[0].style.position="relative"),this.options.addClasses&&this.element.addClass("ui-draggable"),this.options.disabled&&this.element.addClass("ui-draggable-disabled"),this._mouseInit()},_destroy:function(){this.element.removeClass("ui-draggable ui-draggable-dragging ui-draggable-disabled"),this._mouseDestroy()},_mouseCapture:function(t){var n=this.options;return this.helper||n.disabled||e(t.target).closest(".ui-resizable-handle").length>0?!1:(this.handle=this._getHandle(t),this.handle?(e(n.iframeFix===!0?"iframe":n.iframeFix).each(function(){e("<div class='ui-draggable-iframeFix' style='background: #fff;'></div>").css({width:this.offsetWidth+"px",height:this.offsetHeight+"px",position:"absolute",opacity:"0.001",zIndex:1e3}).css(e(this).offset()).appendTo("body")}),!0):!1)},_mouseStart:function(t){var n=this.options;return this.helper=this._createHelper(t),this.helper.addClass("ui-draggable-dragging"),this._cacheHelperProportions(),e.ui.ddmanager&&(e.ui.ddmanager.current=this),this._cacheMargins(),this.cssPosition=this.helper.css("position"),this.scrollParent=this.helper.scrollParent(),this.offsetParent=this.helper.offsetParent(),this.offsetParentCssPosition=this.offsetParent.css("position"),this.offset=this.positionAbs=this.element.offset(),this.offset={top:this.offset.top-this.margins.top,left:this.offset.left-this.margins.left},this.offset.scroll=!1,e.extend(this.offset,{click:{left:t.pageX-this.offset.left,top:t.pageY-this.offset.top},parent:this._getParentOffset(),relative:this._getRelativeOffset()}),this.originalPosition=this.position=this._generatePosition(t),this.originalPageX=t.pageX,this.originalPageY=t.pageY,n.cursorAt&&this._adjustOffsetFromHelper(n.cursorAt),this._setContainment(),this._trigger("start",t)===!1?(this._clear(),!1):(this._cacheHelperProportions(),e.ui.ddmanager&&!n.dropBehaviour&&e.ui.ddmanager.prepareOffsets(this,t),this._mouseDrag(t,!0),e.ui.ddmanager&&e.ui.ddmanager.dragStart(this,t),!0)},_mouseDrag:function(t,n){if("fixed"===this.offsetParentCssPosition&&(this.offset.parent=this._getParentOffset()),this.position=this._generatePosition(t),this.positionAbs=this._convertPositionTo("absolute"),!n){var i=this._uiHash();if(this._trigger("drag",t,i)===!1)return this._mouseUp({}),!1;this.position=i.position}return this.options.axis&&"y"===this.options.axis||(this.helper[0].style.left=this.position.left+"px"),this.options.axis&&"x"===this.options.axis||(this.helper[0].style.top=this.position.top+"px"),e.ui.ddmanager&&e.ui.ddmanager.drag(this,t),!1},_mouseStop:function(t){var n=this,i=!1;return e.ui.ddmanager&&!this.options.dropBehaviour&&(i=e.ui.ddmanager.drop(this,t)),this.dropped&&(i=this.dropped,this.dropped=!1),"original"!==this.options.helper||e.contains(this.element[0].ownerDocument,this.element[0])?("invalid"===this.options.revert&&!i||"valid"===this.options.revert&&i||this.options.revert===!0||e.isFunction(this.options.revert)&&this.options.revert.call(this.element,i)?e(this.helper).animate(this.originalPosition,parseInt(this.options.revertDuration,10),function(){n._trigger("stop",t)!==!1&&n._clear()}):this._trigger("stop",t)!==!1&&this._clear(),!1):!1},_mouseUp:function(t){return e("div.ui-draggable-iframeFix").each(function(){this.parentNode.removeChild(this)}),e.ui.ddmanager&&e.ui.ddmanager.dragStop(this,t),e.ui.mouse.prototype._mouseUp.call(this,t)},cancel:function(){return this.helper.is(".ui-draggable-dragging")?this._mouseUp({}):this._clear(),this},_getHandle:function(t){return this.options.handle?!!e(t.target).closest(this.element.find(this.options.handle)).length:!0},_createHelper:function(t){var n=this.options,i=e.isFunction(n.helper)?e(n.helper.apply(this.element[0],[t])):"clone"===n.helper?this.element.clone().removeAttr("id"):this.element;return i.parents("body").length||i.appendTo("parent"===n.appendTo?this.element[0].parentNode:n.appendTo),i[0]===this.element[0]||/(fixed|absolute)/.test(i.css("position"))||i.css("position","absolute"),i},_adjustOffsetFromHelper:function(t){"string"==typeof t&&(t=t.split(" ")),e.isArray(t)&&(t={left:+t[0],top:+t[1]||0}),"left"in t&&(this.offset.click.left=t.left+this.margins.left),"right"in t&&(this.offset.click.left=this.helperProportions.width-t.right+this.margins.left),"top"in t&&(this.offset.click.top=t.top+this.margins.top),"bottom"in t&&(this.offset.click.top=this.helperProportions.height-t.bottom+this.margins.top)},_getParentOffset:function(){var t=this.offsetParent.offset();return"absolute"===this.cssPosition&&this.scrollParent[0]!==document&&e.contains(this.scrollParent[0],this.offsetParent[0])&&(t.left+=this.scrollParent.scrollLeft(),t.top+=this.scrollParent.scrollTop()),(this.offsetParent[0]===document.body||this.offsetParent[0].tagName&&"html"===this.offsetParent[0].tagName.toLowerCase()&&e.ui.ie)&&(t={top:0,left:0}),{top:t.top+(parseInt(this.offsetParent.css("borderTopWidth"),10)||0),left:t.left+(parseInt(this.offsetParent.css("borderLeftWidth"),10)||0)}},_getRelativeOffset:function(){if("relative"===this.cssPosition){var e=this.element.position();return{top:e.top-(parseInt(this.helper.css("top"),10)||0)+this.scrollParent.scrollTop(),left:e.left-(parseInt(this.helper.css("left"),10)||0)+this.scrollParent.scrollLeft()}}return{top:0,left:0}},_cacheMargins:function(){this.margins={left:parseInt(this.element.css("marginLeft"),10)||0,top:parseInt(this.element.css("marginTop"),10)||0,right:parseInt(this.element.css("marginRight"),10)||0,bottom:parseInt(this.element.css("marginBottom"),10)||0}},_cacheHelperProportions:function(){this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()}},_setContainment:function(){var t,n,i,o=this.options;return o.containment?"window"===o.containment?(this.containment=[e(window).scrollLeft()-this.offset.relative.left-this.offset.parent.left,e(window).scrollTop()-this.offset.relative.top-this.offset.parent.top,e(window).scrollLeft()+e(window).width()-this.helperProportions.width-this.margins.left,e(window).scrollTop()+(e(window).height()||document.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top],void 0):"document"===o.containment?(this.containment=[0,0,e(document).width()-this.helperProportions.width-this.margins.left,(e(document).height()||document.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top],void 0):o.containment.constructor===Array?(this.containment=o.containment,void 0):("parent"===o.containment&&(o.containment=this.helper[0].parentNode),n=e(o.containment),i=n[0],i&&(t="hidden"!==n.css("overflow"),this.containment=[(parseInt(n.css("borderLeftWidth"),10)||0)+(parseInt(n.css("paddingLeft"),10)||0),(parseInt(n.css("borderTopWidth"),10)||0)+(parseInt(n.css("paddingTop"),10)||0),(t?Math.max(i.scrollWidth,i.offsetWidth):i.offsetWidth)-(parseInt(n.css("borderRightWidth"),10)||0)-(parseInt(n.css("paddingRight"),10)||0)-this.helperProportions.width-this.margins.left-this.margins.right,(t?Math.max(i.scrollHeight,i.offsetHeight):i.offsetHeight)-(parseInt(n.css("borderBottomWidth"),10)||0)-(parseInt(n.css("paddingBottom"),10)||0)-this.helperProportions.height-this.margins.top-this.margins.bottom],this.relative_container=n),void 0):(this.containment=null,void 0)},_convertPositionTo:function(t,n){n||(n=this.position);var i="absolute"===t?1:-1,o="absolute"!==this.cssPosition||this.scrollParent[0]!==document&&e.contains(this.scrollParent[0],this.offsetParent[0])?this.scrollParent:this.offsetParent;return this.offset.scroll||(this.offset.scroll={top:o.scrollTop(),left:o.scrollLeft()}),{top:n.top+this.offset.relative.top*i+this.offset.parent.top*i-("fixed"===this.cssPosition?-this.scrollParent.scrollTop():this.offset.scroll.top)*i,left:n.left+this.offset.relative.left*i+this.offset.parent.left*i-("fixed"===this.cssPosition?-this.scrollParent.scrollLeft():this.offset.scroll.left)*i}},_generatePosition:function(t){var n,i,o,r,s=this.options,a="absolute"!==this.cssPosition||this.scrollParent[0]!==document&&e.contains(this.scrollParent[0],this.offsetParent[0])?this.scrollParent:this.offsetParent,l=t.pageX,c=t.pageY;return this.offset.scroll||(this.offset.scroll={top:a.scrollTop(),left:a.scrollLeft()}),this.originalPosition&&(this.containment&&(this.relative_container?(i=this.relative_container.offset(),n=[this.containment[0]+i.left,this.containment[1]+i.top,this.containment[2]+i.left,this.containment[3]+i.top]):n=this.containment,t.pageX-this.offset.click.left<n[0]&&(l=n[0]+this.offset.click.left),t.pageY-this.offset.click.top<n[1]&&(c=n[1]+this.offset.click.top),t.pageX-this.offset.click.left>n[2]&&(l=n[2]+this.offset.click.left),t.pageY-this.offset.click.top>n[3]&&(c=n[3]+this.offset.click.top)),s.grid&&(o=s.grid[1]?this.originalPageY+Math.round((c-this.originalPageY)/s.grid[1])*s.grid[1]:this.originalPageY,c=n?o-this.offset.click.top>=n[1]||o-this.offset.click.top>n[3]?o:o-this.offset.click.top>=n[1]?o-s.grid[1]:o+s.grid[1]:o,r=s.grid[0]?this.originalPageX+Math.round((l-this.originalPageX)/s.grid[0])*s.grid[0]:this.originalPageX,l=n?r-this.offset.click.left>=n[0]||r-this.offset.click.left>n[2]?r:r-this.offset.click.left>=n[0]?r-s.grid[0]:r+s.grid[0]:r)),{top:c-this.offset.click.top-this.offset.relative.top-this.offset.parent.top+("fixed"===this.cssPosition?-this.scrollParent.scrollTop():this.offset.scroll.top),left:l-this.offset.click.left-this.offset.relative.left-this.offset.parent.left+("fixed"===this.cssPosition?-this.scrollParent.scrollLeft():this.offset.scroll.left)}},_clear:function(){this.helper.removeClass("ui-draggable-dragging"),this.helper[0]===this.element[0]||this.cancelHelperRemoval||this.helper.remove(),this.helper=null,this.cancelHelperRemoval=!1},_trigger:function(t,n,i){return i=i||this._uiHash(),e.ui.plugin.call(this,t,[n,i]),"drag"===t&&(this.positionAbs=this._convertPositionTo("absolute")),e.Widget.prototype._trigger.call(this,t,n,i)},plugins:{},_uiHash:function(){return{helper:this.helper,position:this.position,originalPosition:this.originalPosition,offset:this.positionAbs}}}),e.ui.plugin.add("draggable","connectToSortable",{start:function(t,n){var i=e(this).data("ui-draggable"),o=i.options,r=e.extend({},n,{item:i.element});i.sortables=[],e(o.connectToSortable).each(function(){var n=e.data(this,"ui-sortable");n&&!n.options.disabled&&(i.sortables.push({instance:n,shouldRevert:n.options.revert}),n.refreshPositions(),n._trigger("activate",t,r))})},stop:function(t,n){var i=e(this).data("ui-draggable"),o=e.extend({},n,{item:i.element});e.each(i.sortables,function(){this.instance.isOver?(this.instance.isOver=0,i.cancelHelperRemoval=!0,this.instance.cancelHelperRemoval=!1,this.shouldRevert&&(this.instance.options.revert=this.shouldRevert),this.instance._mouseStop(t),this.instance.options.helper=this.instance.options._helper,"original"===i.options.helper&&this.instance.currentItem.css({top:"auto",left:"auto"})):(this.instance.cancelHelperRemoval=!1,this.instance._trigger("deactivate",t,o))})},drag:function(t,n){var i=e(this).data("ui-draggable"),o=this;e.each(i.sortables,function(){var r=!1,s=this;this.instance.positionAbs=i.positionAbs,this.instance.helperProportions=i.helperProportions,this.instance.offset.click=i.offset.click,this.instance._intersectsWith(this.instance.containerCache)&&(r=!0,e.each(i.sortables,function(){return this.instance.positionAbs=i.positionAbs,this.instance.helperProportions=i.helperProportions,this.instance.offset.click=i.offset.click,this!==s&&this.instance._intersectsWith(this.instance.containerCache)&&e.contains(s.instance.element[0],this.instance.element[0])&&(r=!1),r})),r?(this.instance.isOver||(this.instance.isOver=1,this.instance.currentItem=e(o).clone().removeAttr("id").appendTo(this.instance.element).data("ui-sortable-item",!0),this.instance.options._helper=this.instance.options.helper,this.instance.options.helper=function(){return n.helper[0]},t.target=this.instance.currentItem[0],this.instance._mouseCapture(t,!0),this.instance._mouseStart(t,!0,!0),this.instance.offset.click.top=i.offset.click.top,this.instance.offset.click.left=i.offset.click.left,this.instance.offset.parent.left-=i.offset.parent.left-this.instance.offset.parent.left,this.instance.offset.parent.top-=i.offset.parent.top-this.instance.offset.parent.top,i._trigger("toSortable",t),i.dropped=this.instance.element,i.currentItem=i.element,this.instance.fromOutside=i),this.instance.currentItem&&this.instance._mouseDrag(t)):this.instance.isOver&&(this.instance.isOver=0,this.instance.cancelHelperRemoval=!0,this.instance.options.revert=!1,this.instance._trigger("out",t,this.instance._uiHash(this.instance)),this.instance._mouseStop(t,!0),this.instance.options.helper=this.instance.options._helper,this.instance.currentItem.remove(),this.instance.placeholder&&this.instance.placeholder.remove(),i._trigger("fromSortable",t),i.dropped=!1)})}}),e.ui.plugin.add("draggable","cursor",{start:function(){var t=e("body"),n=e(this).data("ui-draggable").options;t.css("cursor")&&(n._cursor=t.css("cursor")),t.css("cursor",n.cursor)},stop:function(){var t=e(this).data("ui-draggable").options;t._cursor&&e("body").css("cursor",t._cursor)}}),e.ui.plugin.add("draggable","opacity",{start:function(t,n){var i=e(n.helper),o=e(this).data("ui-draggable").options;i.css("opacity")&&(o._opacity=i.css("opacity")),i.css("opacity",o.opacity)},stop:function(t,n){var i=e(this).data("ui-draggable").options;i._opacity&&e(n.helper).css("opacity",i._opacity)}}),e.ui.plugin.add("draggable","scroll",{start:function(){var t=e(this).data("ui-draggable");t.scrollParent[0]!==document&&"HTML"!==t.scrollParent[0].tagName&&(t.overflowOffset=t.scrollParent.offset())},drag:function(t){var n=e(this).data("ui-draggable"),i=n.options,o=!1;n.scrollParent[0]!==document&&"HTML"!==n.scrollParent[0].tagName?(i.axis&&"x"===i.axis||(n.overflowOffset.top+n.scrollParent[0].offsetHeight-t.pageY<i.scrollSensitivity?n.scrollParent[0].scrollTop=o=n.scrollParent[0].scrollTop+i.scrollSpeed:t.pageY-n.overflowOffset.top<i.scrollSensitivity&&(n.scrollParent[0].scrollTop=o=n.scrollParent[0].scrollTop-i.scrollSpeed)),i.axis&&"y"===i.axis||(n.overflowOffset.left+n.scrollParent[0].offsetWidth-t.pageX<i.scrollSensitivity?n.scrollParent[0].scrollLeft=o=n.scrollParent[0].scrollLeft+i.scrollSpeed:t.pageX-n.overflowOffset.left<i.scrollSensitivity&&(n.scrollParent[0].scrollLeft=o=n.scrollParent[0].scrollLeft-i.scrollSpeed))):(i.axis&&"x"===i.axis||(t.pageY-e(document).scrollTop()<i.scrollSensitivity?o=e(document).scrollTop(e(document).scrollTop()-i.scrollSpeed):e(window).height()-(t.pageY-e(document).scrollTop())<i.scrollSensitivity&&(o=e(document).scrollTop(e(document).scrollTop()+i.scrollSpeed))),i.axis&&"y"===i.axis||(t.pageX-e(document).scrollLeft()<i.scrollSensitivity?o=e(document).scrollLeft(e(document).scrollLeft()-i.scrollSpeed):e(window).width()-(t.pageX-e(document).scrollLeft())<i.scrollSensitivity&&(o=e(document).scrollLeft(e(document).scrollLeft()+i.scrollSpeed)))),o!==!1&&e.ui.ddmanager&&!i.dropBehaviour&&e.ui.ddmanager.prepareOffsets(n,t)}}),e.ui.plugin.add("draggable","snap",{start:function(){var t=e(this).data("ui-draggable"),n=t.options;t.snapElements=[],e(n.snap.constructor!==String?n.snap.items||":data(ui-draggable)":n.snap).each(function(){var n=e(this),i=n.offset();this!==t.element[0]&&t.snapElements.push({item:this,width:n.outerWidth(),height:n.outerHeight(),top:i.top,left:i.left})})},drag:function(t,n){var i,o,r,s,a,l,c,u,p,d,f=e(this).data("ui-draggable"),h=f.options,g=h.snapTolerance,m=n.offset.left,v=m+f.helperProportions.width,y=n.offset.top,b=y+f.helperProportions.height;for(p=f.snapElements.length-1;p>=0;p--)a=f.snapElements[p].left,l=a+f.snapElements[p].width,c=f.snapElements[p].top,u=c+f.snapElements[p].height,a-g>v||m>l+g||c-g>b||y>u+g||!e.contains(f.snapElements[p].item.ownerDocument,f.snapElements[p].item)?(f.snapElements[p].snapping&&f.options.snap.release&&f.options.snap.release.call(f.element,t,e.extend(f._uiHash(),{snapItem:f.snapElements[p].item})),f.snapElements[p].snapping=!1):("inner"!==h.snapMode&&(i=g>=Math.abs(c-b),o=g>=Math.abs(u-y),r=g>=Math.abs(a-v),s=g>=Math.abs(l-m),i&&(n.position.top=f._convertPositionTo("relative",{top:c-f.helperProportions.height,left:0}).top-f.margins.top),o&&(n.position.top=f._convertPositionTo("relative",{top:u,left:0}).top-f.margins.top),r&&(n.position.left=f._convertPositionTo("relative",{top:0,left:a-f.helperProportions.width}).left-f.margins.left),s&&(n.position.left=f._convertPositionTo("relative",{top:0,left:l}).left-f.margins.left)),d=i||o||r||s,"outer"!==h.snapMode&&(i=g>=Math.abs(c-y),o=g>=Math.abs(u-b),r=g>=Math.abs(a-m),s=g>=Math.abs(l-v),i&&(n.position.top=f._convertPositionTo("relative",{top:c,left:0}).top-f.margins.top),o&&(n.position.top=f._convertPositionTo("relative",{top:u-f.helperProportions.height,left:0}).top-f.margins.top),r&&(n.position.left=f._convertPositionTo("relative",{top:0,left:a}).left-f.margins.left),s&&(n.position.left=f._convertPositionTo("relative",{top:0,left:l-f.helperProportions.width}).left-f.margins.left)),!f.snapElements[p].snapping&&(i||o||r||s||d)&&f.options.snap.snap&&f.options.snap.snap.call(f.element,t,e.extend(f._uiHash(),{snapItem:f.snapElements[p].item})),f.snapElements[p].snapping=i||o||r||s||d)}}),e.ui.plugin.add("draggable","stack",{start:function(){var t,n=this.data("ui-draggable").options,i=e.makeArray(e(n.stack)).sort(function(t,n){return(parseInt(e(t).css("zIndex"),10)||0)-(parseInt(e(n).css("zIndex"),10)||0)});i.length&&(t=parseInt(e(i[0]).css("zIndex"),10)||0,e(i).each(function(n){e(this).css("zIndex",t+n)}),this.css("zIndex",t+i.length))}}),e.ui.plugin.add("draggable","zIndex",{start:function(t,n){var i=e(n.helper),o=e(this).data("ui-draggable").options;i.css("zIndex")&&(o._zIndex=i.css("zIndex")),i.css("zIndex",o.zIndex)},stop:function(t,n){var i=e(this).data("ui-draggable").options;i._zIndex&&e(n.helper).css("zIndex",i._zIndex)}})}(jQuery),/*
 * jQuery UI Touch Punch 0.2.2
 *
 * Copyright 2011, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
function(e){function t(e,t){if(!(e.originalEvent.touches.length>1)){e.preventDefault();var n=e.originalEvent.changedTouches[0],i=document.createEvent("MouseEvents");i.initMouseEvent(t,!0,!0,window,1,n.screenX,n.screenY,n.clientX,n.clientY,!1,!1,!1,!1,0,null),e.target.dispatchEvent(i)}}if(e.support.touch="ontouchend"in document,e.support.touch){var n,i=e.ui.mouse.prototype,o=i._mouseInit;i._touchStart=function(e){var i=this;!n&&i._mouseCapture(e.originalEvent.changedTouches[0])&&(n=!0,i._touchMoved=!1,t(e,"mouseover"),t(e,"mousemove"),t(e,"mousedown"))},i._touchMove=function(e){n&&(this._touchMoved=!0,t(e,"mousemove"))},i._touchEnd=function(e){n&&(t(e,"mouseup"),t(e,"mouseout"),this._touchMoved||t(e,"click"),n=!1)},i._mouseInit=function(){var t=this;t.element.bind("touchstart",e.proxy(t,"_touchStart")).bind("touchmove",e.proxy(t,"_touchMove")).bind("touchend",e.proxy(t,"_touchEnd")),o.call(t)}}}(jQuery),$(document).ready(function(){function e(){$(".ec-body").draggable({axis:"x",distance:20,scroll:!1,revert:!0,start:function(e,t){n=t.position.left},stop:function(e,t){i=t.position.left;var o=i>n?0:1,r=n-i;Math.abs(r)>=100&&(0==o?$("#left-arrow").click():1==o&&$("#right-arrow").click())}})}var t,n,i;$(document).on("ajax:beforeSend","a.nav-links",function(){t=setTimeout(function(){$("#spinner").fadeIn("fast")},500)}),$(document).ajaxComplete(function(){clearTimeout(t),$("#spinner").fadeOut("fast"),e()}),$(document).bind("keydown",function(e){37==e.keyCode&&$("#left-arrow").click()}),$(document).bind("keydown",function(e){39==e.keyCode&&$("#right-arrow").click()}),e(),$(".mediaTable").mediaTable()});