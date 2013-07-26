/*! jQuery UI - v1.10.3 - 2013-07-21
* http://jqueryui.com
* Includes: jquery.ui.core.js, jquery.ui.widget.js, jquery.ui.mouse.js, jquery.ui.draggable.js
* Copyright 2013 jQuery Foundation and other contributors Licensed MIT */
!function(t,e){function n(e,n){var o,r,s,a=e.nodeName.toLowerCase();return"area"===a?(o=e.parentNode,r=o.name,e.href&&r&&"map"===o.nodeName.toLowerCase()?(s=t("img[usemap=#"+r+"]")[0],!!s&&i(s)):!1):(/input|select|textarea|button|object/.test(a)?!e.disabled:"a"===a?e.href||n:n)&&i(e)}function i(e){return t.expr.filters.visible(e)&&!t(e).parents().addBack().filter(function(){return"hidden"===t.css(this,"visibility")}).length}var o=0,r=/^ui-id-\d+$/;t.ui=t.ui||{},t.extend(t.ui,{version:"1.10.3",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),t.fn.extend({focus:function(e){return function(n,i){return"number"==typeof n?this.each(function(){var e=this;setTimeout(function(){t(e).focus(),i&&i.call(e)},n)}):e.apply(this,arguments)}}(t.fn.focus),scrollParent:function(){var e;return e=t.ui.ie&&/(static|relative)/.test(this.css("position"))||/absolute/.test(this.css("position"))?this.parents().filter(function(){return/(relative|absolute|fixed)/.test(t.css(this,"position"))&&/(auto|scroll)/.test(t.css(this,"overflow")+t.css(this,"overflow-y")+t.css(this,"overflow-x"))}).eq(0):this.parents().filter(function(){return/(auto|scroll)/.test(t.css(this,"overflow")+t.css(this,"overflow-y")+t.css(this,"overflow-x"))}).eq(0),/fixed/.test(this.css("position"))||!e.length?t(document):e},zIndex:function(n){if(n!==e)return this.css("zIndex",n);if(this.length)for(var i,o,r=t(this[0]);r.length&&r[0]!==document;){if(i=r.css("position"),("absolute"===i||"relative"===i||"fixed"===i)&&(o=parseInt(r.css("zIndex"),10),!isNaN(o)&&0!==o))return o;r=r.parent()}return 0},uniqueId:function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++o)})},removeUniqueId:function(){return this.each(function(){r.test(this.id)&&t(this).removeAttr("id")})}}),t.extend(t.expr[":"],{data:t.expr.createPseudo?t.expr.createPseudo(function(e){return function(n){return!!t.data(n,e)}}):function(e,n,i){return!!t.data(e,i[3])},focusable:function(e){return n(e,!isNaN(t.attr(e,"tabindex")))},tabbable:function(e){var i=t.attr(e,"tabindex"),o=isNaN(i);return(o||i>=0)&&n(e,!o)}}),t("<a>").outerWidth(1).jquery||t.each(["Width","Height"],function(n,i){function o(e,n,i,o){return t.each(r,function(){n-=parseFloat(t.css(e,"padding"+this))||0,i&&(n-=parseFloat(t.css(e,"border"+this+"Width"))||0),o&&(n-=parseFloat(t.css(e,"margin"+this))||0)}),n}var r="Width"===i?["Left","Right"]:["Top","Bottom"],s=i.toLowerCase(),a={innerWidth:t.fn.innerWidth,innerHeight:t.fn.innerHeight,outerWidth:t.fn.outerWidth,outerHeight:t.fn.outerHeight};t.fn["inner"+i]=function(n){return n===e?a["inner"+i].call(this):this.each(function(){t(this).css(s,o(this,n)+"px")})},t.fn["outer"+i]=function(e,n){return"number"!=typeof e?a["outer"+i].call(this,e):this.each(function(){t(this).css(s,o(this,e,!0,n)+"px")})}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(t.fn.removeData=function(e){return function(n){return arguments.length?e.call(this,t.camelCase(n)):e.call(this)}}(t.fn.removeData)),t.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),t.support.selectstart="onselectstart"in document.createElement("div"),t.fn.extend({disableSelection:function(){return this.bind((t.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(t){t.preventDefault()})},enableSelection:function(){return this.unbind(".ui-disableSelection")}}),t.extend(t.ui,{plugin:{add:function(e,n,i){var o,r=t.ui[e].prototype;for(o in i)r.plugins[o]=r.plugins[o]||[],r.plugins[o].push([n,i[o]])},call:function(t,e,n){var i,o=t.plugins[e];if(o&&t.element[0].parentNode&&11!==t.element[0].parentNode.nodeType)for(i=0;o.length>i;i++)t.options[o[i][0]]&&o[i][1].apply(t.element,n)}},hasScroll:function(e,n){if("hidden"===t(e).css("overflow"))return!1;var i=n&&"left"===n?"scrollLeft":"scrollTop",o=!1;return e[i]>0?!0:(e[i]=1,o=e[i]>0,e[i]=0,o)}})}(jQuery),function(t,e){var n=0,i=Array.prototype.slice,o=t.cleanData;t.cleanData=function(e){for(var n,i=0;null!=(n=e[i]);i++)try{t(n).triggerHandler("remove")}catch(r){}o(e)},t.widget=function(n,i,o){var r,s,a,l,c={},u=n.split(".")[0];n=n.split(".")[1],r=u+"-"+n,o||(o=i,i=t.Widget),t.expr[":"][r.toLowerCase()]=function(e){return!!t.data(e,r)},t[u]=t[u]||{},s=t[u][n],a=t[u][n]=function(t,n){return this._createWidget?(arguments.length&&this._createWidget(t,n),e):new a(t,n)},t.extend(a,s,{version:o.version,_proto:t.extend({},o),_childConstructors:[]}),l=new i,l.options=t.widget.extend({},l.options),t.each(o,function(n,o){return t.isFunction(o)?(c[n]=function(){var t=function(){return i.prototype[n].apply(this,arguments)},e=function(t){return i.prototype[n].apply(this,t)};return function(){var n,i=this._super,r=this._superApply;return this._super=t,this._superApply=e,n=o.apply(this,arguments),this._super=i,this._superApply=r,n}}(),e):(c[n]=o,e)}),a.prototype=t.widget.extend(l,{widgetEventPrefix:s?l.widgetEventPrefix:n},c,{constructor:a,namespace:u,widgetName:n,widgetFullName:r}),s?(t.each(s._childConstructors,function(e,n){var i=n.prototype;t.widget(i.namespace+"."+i.widgetName,a,n._proto)}),delete s._childConstructors):i._childConstructors.push(a),t.widget.bridge(n,a)},t.widget.extend=function(n){for(var o,r,s=i.call(arguments,1),a=0,l=s.length;l>a;a++)for(o in s[a])r=s[a][o],s[a].hasOwnProperty(o)&&r!==e&&(n[o]=t.isPlainObject(r)?t.isPlainObject(n[o])?t.widget.extend({},n[o],r):t.widget.extend({},r):r);return n},t.widget.bridge=function(n,o){var r=o.prototype.widgetFullName||n;t.fn[n]=function(s){var a="string"==typeof s,l=i.call(arguments,1),c=this;return s=!a&&l.length?t.widget.extend.apply(null,[s].concat(l)):s,a?this.each(function(){var i,o=t.data(this,r);return o?t.isFunction(o[s])&&"_"!==s.charAt(0)?(i=o[s].apply(o,l),i!==o&&i!==e?(c=i&&i.jquery?c.pushStack(i.get()):i,!1):e):t.error("no such method '"+s+"' for "+n+" widget instance"):t.error("cannot call methods on "+n+" prior to initialization; "+"attempted to call method '"+s+"'")}):this.each(function(){var e=t.data(this,r);e?e.option(s||{})._init():t.data(this,r,new o(s,this))}),c}},t.Widget=function(){},t.Widget._childConstructors=[],t.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(e,i){i=t(i||this.defaultElement||this)[0],this.element=t(i),this.uuid=n++,this.eventNamespace="."+this.widgetName+this.uuid,this.options=t.widget.extend({},this.options,this._getCreateOptions(),e),this.bindings=t(),this.hoverable=t(),this.focusable=t(),i!==this&&(t.data(i,this.widgetFullName,this),this._on(!0,this.element,{remove:function(t){t.target===i&&this.destroy()}}),this.document=t(i.style?i.ownerDocument:i.document||i),this.window=t(this.document[0].defaultView||this.document[0].parentWindow)),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:t.noop,_getCreateEventData:t.noop,_create:t.noop,_init:t.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(t.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled "+"ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:t.noop,widget:function(){return this.element},option:function(n,i){var o,r,s,a=n;if(0===arguments.length)return t.widget.extend({},this.options);if("string"==typeof n)if(a={},o=n.split("."),n=o.shift(),o.length){for(r=a[n]=t.widget.extend({},this.options[n]),s=0;o.length-1>s;s++)r[o[s]]=r[o[s]]||{},r=r[o[s]];if(n=o.pop(),i===e)return r[n]===e?null:r[n];r[n]=i}else{if(i===e)return this.options[n]===e?null:this.options[n];a[n]=i}return this._setOptions(a),this},_setOptions:function(t){var e;for(e in t)this._setOption(e,t[e]);return this},_setOption:function(t,e){return this.options[t]=e,"disabled"===t&&(this.widget().toggleClass(this.widgetFullName+"-disabled ui-state-disabled",!!e).attr("aria-disabled",e),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")),this},enable:function(){return this._setOption("disabled",!1)},disable:function(){return this._setOption("disabled",!0)},_on:function(n,i,o){var r,s=this;"boolean"!=typeof n&&(o=i,i=n,n=!1),o?(i=r=t(i),this.bindings=this.bindings.add(i)):(o=i,i=this.element,r=this.widget()),t.each(o,function(o,a){function l(){return n||s.options.disabled!==!0&&!t(this).hasClass("ui-state-disabled")?("string"==typeof a?s[a]:a).apply(s,arguments):e}"string"!=typeof a&&(l.guid=a.guid=a.guid||l.guid||t.guid++);var c=o.match(/^(\w+)\s*(.*)$/),u=c[1]+s.eventNamespace,p=c[2];p?r.delegate(p,u,l):i.bind(u,l)})},_off:function(t,e){e=(e||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,t.unbind(e).undelegate(e)},_delay:function(t,e){function n(){return("string"==typeof t?i[t]:t).apply(i,arguments)}var i=this;return setTimeout(n,e||0)},_hoverable:function(e){this.hoverable=this.hoverable.add(e),this._on(e,{mouseenter:function(e){t(e.currentTarget).addClass("ui-state-hover")},mouseleave:function(e){t(e.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(e){this.focusable=this.focusable.add(e),this._on(e,{focusin:function(e){t(e.currentTarget).addClass("ui-state-focus")},focusout:function(e){t(e.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(e,n,i){var o,r,s=this.options[e];if(i=i||{},n=t.Event(n),n.type=(e===this.widgetEventPrefix?e:this.widgetEventPrefix+e).toLowerCase(),n.target=this.element[0],r=n.originalEvent)for(o in r)o in n||(n[o]=r[o]);return this.element.trigger(n,i),!(t.isFunction(s)&&s.apply(this.element[0],[n].concat(i))===!1||n.isDefaultPrevented())}},t.each({show:"fadeIn",hide:"fadeOut"},function(e,n){t.Widget.prototype["_"+e]=function(i,o,r){"string"==typeof o&&(o={effect:o});var s,a=o?o===!0||"number"==typeof o?n:o.effect||n:e;o=o||{},"number"==typeof o&&(o={duration:o}),s=!t.isEmptyObject(o),o.complete=r,o.delay&&i.delay(o.delay),s&&t.effects&&t.effects.effect[a]?i[e](o):a!==e&&i[a]?i[a](o.duration,o.easing,r):i.queue(function(n){t(this)[e](),r&&r.call(i[0]),n()})}})}(jQuery),function(t){var e=!1;t(document).mouseup(function(){e=!1}),t.widget("ui.mouse",{version:"1.10.3",options:{cancel:"input,textarea,button,select,option",distance:1,delay:0},_mouseInit:function(){var e=this;this.element.bind("mousedown."+this.widgetName,function(t){return e._mouseDown(t)}).bind("click."+this.widgetName,function(n){return!0===t.data(n.target,e.widgetName+".preventClickEvent")?(t.removeData(n.target,e.widgetName+".preventClickEvent"),n.stopImmediatePropagation(),!1):void 0}),this.started=!1},_mouseDestroy:function(){this.element.unbind("."+this.widgetName),this._mouseMoveDelegate&&t(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(n){if(!e){this._mouseStarted&&this._mouseUp(n),this._mouseDownEvent=n;var i=this,o=1===n.which,r="string"==typeof this.options.cancel&&n.target.nodeName?t(n.target).closest(this.options.cancel).length:!1;return o&&!r&&this._mouseCapture(n)?(this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){i.mouseDelayMet=!0},this.options.delay)),this._mouseDistanceMet(n)&&this._mouseDelayMet(n)&&(this._mouseStarted=this._mouseStart(n)!==!1,!this._mouseStarted)?(n.preventDefault(),!0):(!0===t.data(n.target,this.widgetName+".preventClickEvent")&&t.removeData(n.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(t){return i._mouseMove(t)},this._mouseUpDelegate=function(t){return i._mouseUp(t)},t(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate),n.preventDefault(),e=!0,!0)):!0}},_mouseMove:function(e){return t.ui.ie&&(!document.documentMode||9>document.documentMode)&&!e.button?this._mouseUp(e):this._mouseStarted?(this._mouseDrag(e),e.preventDefault()):(this._mouseDistanceMet(e)&&this._mouseDelayMet(e)&&(this._mouseStarted=this._mouseStart(this._mouseDownEvent,e)!==!1,this._mouseStarted?this._mouseDrag(e):this._mouseUp(e)),!this._mouseStarted)},_mouseUp:function(e){return t(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,e.target===this._mouseDownEvent.target&&t.data(e.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(e)),!1},_mouseDistanceMet:function(t){return Math.max(Math.abs(this._mouseDownEvent.pageX-t.pageX),Math.abs(this._mouseDownEvent.pageY-t.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return!0}})}(jQuery),function(t){t.widget("ui.draggable",t.ui.mouse,{version:"1.10.3",widgetEventPrefix:"drag",options:{addClasses:!0,appendTo:"parent",axis:!1,connectToSortable:!1,containment:!1,cursor:"auto",cursorAt:!1,grid:!1,handle:!1,helper:"original",iframeFix:!1,opacity:!1,refreshPositions:!1,revert:!1,revertDuration:500,scope:"default",scroll:!0,scrollSensitivity:20,scrollSpeed:20,snap:!1,snapMode:"both",snapTolerance:20,stack:!1,zIndex:!1,drag:null,start:null,stop:null},_create:function(){"original"!==this.options.helper||/^(?:r|a|f)/.test(this.element.css("position"))||(this.element[0].style.position="relative"),this.options.addClasses&&this.element.addClass("ui-draggable"),this.options.disabled&&this.element.addClass("ui-draggable-disabled"),this._mouseInit()},_destroy:function(){this.element.removeClass("ui-draggable ui-draggable-dragging ui-draggable-disabled"),this._mouseDestroy()},_mouseCapture:function(e){var n=this.options;return this.helper||n.disabled||t(e.target).closest(".ui-resizable-handle").length>0?!1:(this.handle=this._getHandle(e),this.handle?(t(n.iframeFix===!0?"iframe":n.iframeFix).each(function(){t("<div class='ui-draggable-iframeFix' style='background: #fff;'></div>").css({width:this.offsetWidth+"px",height:this.offsetHeight+"px",position:"absolute",opacity:"0.001",zIndex:1e3}).css(t(this).offset()).appendTo("body")}),!0):!1)},_mouseStart:function(e){var n=this.options;return this.helper=this._createHelper(e),this.helper.addClass("ui-draggable-dragging"),this._cacheHelperProportions(),t.ui.ddmanager&&(t.ui.ddmanager.current=this),this._cacheMargins(),this.cssPosition=this.helper.css("position"),this.scrollParent=this.helper.scrollParent(),this.offsetParent=this.helper.offsetParent(),this.offsetParentCssPosition=this.offsetParent.css("position"),this.offset=this.positionAbs=this.element.offset(),this.offset={top:this.offset.top-this.margins.top,left:this.offset.left-this.margins.left},this.offset.scroll=!1,t.extend(this.offset,{click:{left:e.pageX-this.offset.left,top:e.pageY-this.offset.top},parent:this._getParentOffset(),relative:this._getRelativeOffset()}),this.originalPosition=this.position=this._generatePosition(e),this.originalPageX=e.pageX,this.originalPageY=e.pageY,n.cursorAt&&this._adjustOffsetFromHelper(n.cursorAt),this._setContainment(),this._trigger("start",e)===!1?(this._clear(),!1):(this._cacheHelperProportions(),t.ui.ddmanager&&!n.dropBehaviour&&t.ui.ddmanager.prepareOffsets(this,e),this._mouseDrag(e,!0),t.ui.ddmanager&&t.ui.ddmanager.dragStart(this,e),!0)},_mouseDrag:function(e,n){if("fixed"===this.offsetParentCssPosition&&(this.offset.parent=this._getParentOffset()),this.position=this._generatePosition(e),this.positionAbs=this._convertPositionTo("absolute"),!n){var i=this._uiHash();if(this._trigger("drag",e,i)===!1)return this._mouseUp({}),!1;this.position=i.position}return this.options.axis&&"y"===this.options.axis||(this.helper[0].style.left=this.position.left+"px"),this.options.axis&&"x"===this.options.axis||(this.helper[0].style.top=this.position.top+"px"),t.ui.ddmanager&&t.ui.ddmanager.drag(this,e),!1},_mouseStop:function(e){var n=this,i=!1;return t.ui.ddmanager&&!this.options.dropBehaviour&&(i=t.ui.ddmanager.drop(this,e)),this.dropped&&(i=this.dropped,this.dropped=!1),"original"!==this.options.helper||t.contains(this.element[0].ownerDocument,this.element[0])?("invalid"===this.options.revert&&!i||"valid"===this.options.revert&&i||this.options.revert===!0||t.isFunction(this.options.revert)&&this.options.revert.call(this.element,i)?t(this.helper).animate(this.originalPosition,parseInt(this.options.revertDuration,10),function(){n._trigger("stop",e)!==!1&&n._clear()}):this._trigger("stop",e)!==!1&&this._clear(),!1):!1},_mouseUp:function(e){return t("div.ui-draggable-iframeFix").each(function(){this.parentNode.removeChild(this)}),t.ui.ddmanager&&t.ui.ddmanager.dragStop(this,e),t.ui.mouse.prototype._mouseUp.call(this,e)},cancel:function(){return this.helper.is(".ui-draggable-dragging")?this._mouseUp({}):this._clear(),this},_getHandle:function(e){return this.options.handle?!!t(e.target).closest(this.element.find(this.options.handle)).length:!0},_createHelper:function(e){var n=this.options,i=t.isFunction(n.helper)?t(n.helper.apply(this.element[0],[e])):"clone"===n.helper?this.element.clone().removeAttr("id"):this.element;return i.parents("body").length||i.appendTo("parent"===n.appendTo?this.element[0].parentNode:n.appendTo),i[0]===this.element[0]||/(fixed|absolute)/.test(i.css("position"))||i.css("position","absolute"),i},_adjustOffsetFromHelper:function(e){"string"==typeof e&&(e=e.split(" ")),t.isArray(e)&&(e={left:+e[0],top:+e[1]||0}),"left"in e&&(this.offset.click.left=e.left+this.margins.left),"right"in e&&(this.offset.click.left=this.helperProportions.width-e.right+this.margins.left),"top"in e&&(this.offset.click.top=e.top+this.margins.top),"bottom"in e&&(this.offset.click.top=this.helperProportions.height-e.bottom+this.margins.top)},_getParentOffset:function(){var e=this.offsetParent.offset();return"absolute"===this.cssPosition&&this.scrollParent[0]!==document&&t.contains(this.scrollParent[0],this.offsetParent[0])&&(e.left+=this.scrollParent.scrollLeft(),e.top+=this.scrollParent.scrollTop()),(this.offsetParent[0]===document.body||this.offsetParent[0].tagName&&"html"===this.offsetParent[0].tagName.toLowerCase()&&t.ui.ie)&&(e={top:0,left:0}),{top:e.top+(parseInt(this.offsetParent.css("borderTopWidth"),10)||0),left:e.left+(parseInt(this.offsetParent.css("borderLeftWidth"),10)||0)}},_getRelativeOffset:function(){if("relative"===this.cssPosition){var t=this.element.position();return{top:t.top-(parseInt(this.helper.css("top"),10)||0)+this.scrollParent.scrollTop(),left:t.left-(parseInt(this.helper.css("left"),10)||0)+this.scrollParent.scrollLeft()}}return{top:0,left:0}},_cacheMargins:function(){this.margins={left:parseInt(this.element.css("marginLeft"),10)||0,top:parseInt(this.element.css("marginTop"),10)||0,right:parseInt(this.element.css("marginRight"),10)||0,bottom:parseInt(this.element.css("marginBottom"),10)||0}},_cacheHelperProportions:function(){this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()}},_setContainment:function(){var e,n,i,o=this.options;return o.containment?"window"===o.containment?(this.containment=[t(window).scrollLeft()-this.offset.relative.left-this.offset.parent.left,t(window).scrollTop()-this.offset.relative.top-this.offset.parent.top,t(window).scrollLeft()+t(window).width()-this.helperProportions.width-this.margins.left,t(window).scrollTop()+(t(window).height()||document.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top],void 0):"document"===o.containment?(this.containment=[0,0,t(document).width()-this.helperProportions.width-this.margins.left,(t(document).height()||document.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top],void 0):o.containment.constructor===Array?(this.containment=o.containment,void 0):("parent"===o.containment&&(o.containment=this.helper[0].parentNode),n=t(o.containment),i=n[0],i&&(e="hidden"!==n.css("overflow"),this.containment=[(parseInt(n.css("borderLeftWidth"),10)||0)+(parseInt(n.css("paddingLeft"),10)||0),(parseInt(n.css("borderTopWidth"),10)||0)+(parseInt(n.css("paddingTop"),10)||0),(e?Math.max(i.scrollWidth,i.offsetWidth):i.offsetWidth)-(parseInt(n.css("borderRightWidth"),10)||0)-(parseInt(n.css("paddingRight"),10)||0)-this.helperProportions.width-this.margins.left-this.margins.right,(e?Math.max(i.scrollHeight,i.offsetHeight):i.offsetHeight)-(parseInt(n.css("borderBottomWidth"),10)||0)-(parseInt(n.css("paddingBottom"),10)||0)-this.helperProportions.height-this.margins.top-this.margins.bottom],this.relative_container=n),void 0):(this.containment=null,void 0)},_convertPositionTo:function(e,n){n||(n=this.position);var i="absolute"===e?1:-1,o="absolute"!==this.cssPosition||this.scrollParent[0]!==document&&t.contains(this.scrollParent[0],this.offsetParent[0])?this.scrollParent:this.offsetParent;return this.offset.scroll||(this.offset.scroll={top:o.scrollTop(),left:o.scrollLeft()}),{top:n.top+this.offset.relative.top*i+this.offset.parent.top*i-("fixed"===this.cssPosition?-this.scrollParent.scrollTop():this.offset.scroll.top)*i,left:n.left+this.offset.relative.left*i+this.offset.parent.left*i-("fixed"===this.cssPosition?-this.scrollParent.scrollLeft():this.offset.scroll.left)*i}},_generatePosition:function(e){var n,i,o,r,s=this.options,a="absolute"!==this.cssPosition||this.scrollParent[0]!==document&&t.contains(this.scrollParent[0],this.offsetParent[0])?this.scrollParent:this.offsetParent,l=e.pageX,c=e.pageY;return this.offset.scroll||(this.offset.scroll={top:a.scrollTop(),left:a.scrollLeft()}),this.originalPosition&&(this.containment&&(this.relative_container?(i=this.relative_container.offset(),n=[this.containment[0]+i.left,this.containment[1]+i.top,this.containment[2]+i.left,this.containment[3]+i.top]):n=this.containment,e.pageX-this.offset.click.left<n[0]&&(l=n[0]+this.offset.click.left),e.pageY-this.offset.click.top<n[1]&&(c=n[1]+this.offset.click.top),e.pageX-this.offset.click.left>n[2]&&(l=n[2]+this.offset.click.left),e.pageY-this.offset.click.top>n[3]&&(c=n[3]+this.offset.click.top)),s.grid&&(o=s.grid[1]?this.originalPageY+Math.round((c-this.originalPageY)/s.grid[1])*s.grid[1]:this.originalPageY,c=n?o-this.offset.click.top>=n[1]||o-this.offset.click.top>n[3]?o:o-this.offset.click.top>=n[1]?o-s.grid[1]:o+s.grid[1]:o,r=s.grid[0]?this.originalPageX+Math.round((l-this.originalPageX)/s.grid[0])*s.grid[0]:this.originalPageX,l=n?r-this.offset.click.left>=n[0]||r-this.offset.click.left>n[2]?r:r-this.offset.click.left>=n[0]?r-s.grid[0]:r+s.grid[0]:r)),{top:c-this.offset.click.top-this.offset.relative.top-this.offset.parent.top+("fixed"===this.cssPosition?-this.scrollParent.scrollTop():this.offset.scroll.top),left:l-this.offset.click.left-this.offset.relative.left-this.offset.parent.left+("fixed"===this.cssPosition?-this.scrollParent.scrollLeft():this.offset.scroll.left)}},_clear:function(){this.helper.removeClass("ui-draggable-dragging"),this.helper[0]===this.element[0]||this.cancelHelperRemoval||this.helper.remove(),this.helper=null,this.cancelHelperRemoval=!1},_trigger:function(e,n,i){return i=i||this._uiHash(),t.ui.plugin.call(this,e,[n,i]),"drag"===e&&(this.positionAbs=this._convertPositionTo("absolute")),t.Widget.prototype._trigger.call(this,e,n,i)},plugins:{},_uiHash:function(){return{helper:this.helper,position:this.position,originalPosition:this.originalPosition,offset:this.positionAbs}}}),t.ui.plugin.add("draggable","connectToSortable",{start:function(e,n){var i=t(this).data("ui-draggable"),o=i.options,r=t.extend({},n,{item:i.element});i.sortables=[],t(o.connectToSortable).each(function(){var n=t.data(this,"ui-sortable");n&&!n.options.disabled&&(i.sortables.push({instance:n,shouldRevert:n.options.revert}),n.refreshPositions(),n._trigger("activate",e,r))})},stop:function(e,n){var i=t(this).data("ui-draggable"),o=t.extend({},n,{item:i.element});t.each(i.sortables,function(){this.instance.isOver?(this.instance.isOver=0,i.cancelHelperRemoval=!0,this.instance.cancelHelperRemoval=!1,this.shouldRevert&&(this.instance.options.revert=this.shouldRevert),this.instance._mouseStop(e),this.instance.options.helper=this.instance.options._helper,"original"===i.options.helper&&this.instance.currentItem.css({top:"auto",left:"auto"})):(this.instance.cancelHelperRemoval=!1,this.instance._trigger("deactivate",e,o))})},drag:function(e,n){var i=t(this).data("ui-draggable"),o=this;t.each(i.sortables,function(){var r=!1,s=this;this.instance.positionAbs=i.positionAbs,this.instance.helperProportions=i.helperProportions,this.instance.offset.click=i.offset.click,this.instance._intersectsWith(this.instance.containerCache)&&(r=!0,t.each(i.sortables,function(){return this.instance.positionAbs=i.positionAbs,this.instance.helperProportions=i.helperProportions,this.instance.offset.click=i.offset.click,this!==s&&this.instance._intersectsWith(this.instance.containerCache)&&t.contains(s.instance.element[0],this.instance.element[0])&&(r=!1),r})),r?(this.instance.isOver||(this.instance.isOver=1,this.instance.currentItem=t(o).clone().removeAttr("id").appendTo(this.instance.element).data("ui-sortable-item",!0),this.instance.options._helper=this.instance.options.helper,this.instance.options.helper=function(){return n.helper[0]},e.target=this.instance.currentItem[0],this.instance._mouseCapture(e,!0),this.instance._mouseStart(e,!0,!0),this.instance.offset.click.top=i.offset.click.top,this.instance.offset.click.left=i.offset.click.left,this.instance.offset.parent.left-=i.offset.parent.left-this.instance.offset.parent.left,this.instance.offset.parent.top-=i.offset.parent.top-this.instance.offset.parent.top,i._trigger("toSortable",e),i.dropped=this.instance.element,i.currentItem=i.element,this.instance.fromOutside=i),this.instance.currentItem&&this.instance._mouseDrag(e)):this.instance.isOver&&(this.instance.isOver=0,this.instance.cancelHelperRemoval=!0,this.instance.options.revert=!1,this.instance._trigger("out",e,this.instance._uiHash(this.instance)),this.instance._mouseStop(e,!0),this.instance.options.helper=this.instance.options._helper,this.instance.currentItem.remove(),this.instance.placeholder&&this.instance.placeholder.remove(),i._trigger("fromSortable",e),i.dropped=!1)})}}),t.ui.plugin.add("draggable","cursor",{start:function(){var e=t("body"),n=t(this).data("ui-draggable").options;e.css("cursor")&&(n._cursor=e.css("cursor")),e.css("cursor",n.cursor)},stop:function(){var e=t(this).data("ui-draggable").options;e._cursor&&t("body").css("cursor",e._cursor)}}),t.ui.plugin.add("draggable","opacity",{start:function(e,n){var i=t(n.helper),o=t(this).data("ui-draggable").options;i.css("opacity")&&(o._opacity=i.css("opacity")),i.css("opacity",o.opacity)},stop:function(e,n){var i=t(this).data("ui-draggable").options;i._opacity&&t(n.helper).css("opacity",i._opacity)}}),t.ui.plugin.add("draggable","scroll",{start:function(){var e=t(this).data("ui-draggable");e.scrollParent[0]!==document&&"HTML"!==e.scrollParent[0].tagName&&(e.overflowOffset=e.scrollParent.offset())},drag:function(e){var n=t(this).data("ui-draggable"),i=n.options,o=!1;n.scrollParent[0]!==document&&"HTML"!==n.scrollParent[0].tagName?(i.axis&&"x"===i.axis||(n.overflowOffset.top+n.scrollParent[0].offsetHeight-e.pageY<i.scrollSensitivity?n.scrollParent[0].scrollTop=o=n.scrollParent[0].scrollTop+i.scrollSpeed:e.pageY-n.overflowOffset.top<i.scrollSensitivity&&(n.scrollParent[0].scrollTop=o=n.scrollParent[0].scrollTop-i.scrollSpeed)),i.axis&&"y"===i.axis||(n.overflowOffset.left+n.scrollParent[0].offsetWidth-e.pageX<i.scrollSensitivity?n.scrollParent[0].scrollLeft=o=n.scrollParent[0].scrollLeft+i.scrollSpeed:e.pageX-n.overflowOffset.left<i.scrollSensitivity&&(n.scrollParent[0].scrollLeft=o=n.scrollParent[0].scrollLeft-i.scrollSpeed))):(i.axis&&"x"===i.axis||(e.pageY-t(document).scrollTop()<i.scrollSensitivity?o=t(document).scrollTop(t(document).scrollTop()-i.scrollSpeed):t(window).height()-(e.pageY-t(document).scrollTop())<i.scrollSensitivity&&(o=t(document).scrollTop(t(document).scrollTop()+i.scrollSpeed))),i.axis&&"y"===i.axis||(e.pageX-t(document).scrollLeft()<i.scrollSensitivity?o=t(document).scrollLeft(t(document).scrollLeft()-i.scrollSpeed):t(window).width()-(e.pageX-t(document).scrollLeft())<i.scrollSensitivity&&(o=t(document).scrollLeft(t(document).scrollLeft()+i.scrollSpeed)))),o!==!1&&t.ui.ddmanager&&!i.dropBehaviour&&t.ui.ddmanager.prepareOffsets(n,e)}}),t.ui.plugin.add("draggable","snap",{start:function(){var e=t(this).data("ui-draggable"),n=e.options;e.snapElements=[],t(n.snap.constructor!==String?n.snap.items||":data(ui-draggable)":n.snap).each(function(){var n=t(this),i=n.offset();this!==e.element[0]&&e.snapElements.push({item:this,width:n.outerWidth(),height:n.outerHeight(),top:i.top,left:i.left})})},drag:function(e,n){var i,o,r,s,a,l,c,u,p,h,d=t(this).data("ui-draggable"),f=d.options,g=f.snapTolerance,m=n.offset.left,v=m+d.helperProportions.width,y=n.offset.top,b=y+d.helperProportions.height;for(p=d.snapElements.length-1;p>=0;p--)a=d.snapElements[p].left,l=a+d.snapElements[p].width,c=d.snapElements[p].top,u=c+d.snapElements[p].height,a-g>v||m>l+g||c-g>b||y>u+g||!t.contains(d.snapElements[p].item.ownerDocument,d.snapElements[p].item)?(d.snapElements[p].snapping&&d.options.snap.release&&d.options.snap.release.call(d.element,e,t.extend(d._uiHash(),{snapItem:d.snapElements[p].item})),d.snapElements[p].snapping=!1):("inner"!==f.snapMode&&(i=g>=Math.abs(c-b),o=g>=Math.abs(u-y),r=g>=Math.abs(a-v),s=g>=Math.abs(l-m),i&&(n.position.top=d._convertPositionTo("relative",{top:c-d.helperProportions.height,left:0}).top-d.margins.top),o&&(n.position.top=d._convertPositionTo("relative",{top:u,left:0}).top-d.margins.top),r&&(n.position.left=d._convertPositionTo("relative",{top:0,left:a-d.helperProportions.width}).left-d.margins.left),s&&(n.position.left=d._convertPositionTo("relative",{top:0,left:l}).left-d.margins.left)),h=i||o||r||s,"outer"!==f.snapMode&&(i=g>=Math.abs(c-y),o=g>=Math.abs(u-b),r=g>=Math.abs(a-m),s=g>=Math.abs(l-v),i&&(n.position.top=d._convertPositionTo("relative",{top:c,left:0}).top-d.margins.top),o&&(n.position.top=d._convertPositionTo("relative",{top:u-d.helperProportions.height,left:0}).top-d.margins.top),r&&(n.position.left=d._convertPositionTo("relative",{top:0,left:a}).left-d.margins.left),s&&(n.position.left=d._convertPositionTo("relative",{top:0,left:l-d.helperProportions.width}).left-d.margins.left)),!d.snapElements[p].snapping&&(i||o||r||s||h)&&d.options.snap.snap&&d.options.snap.snap.call(d.element,e,t.extend(d._uiHash(),{snapItem:d.snapElements[p].item})),d.snapElements[p].snapping=i||o||r||s||h)}}),t.ui.plugin.add("draggable","stack",{start:function(){var e,n=this.data("ui-draggable").options,i=t.makeArray(t(n.stack)).sort(function(e,n){return(parseInt(t(e).css("zIndex"),10)||0)-(parseInt(t(n).css("zIndex"),10)||0)});i.length&&(e=parseInt(t(i[0]).css("zIndex"),10)||0,t(i).each(function(n){t(this).css("zIndex",e+n)}),this.css("zIndex",e+i.length))}}),t.ui.plugin.add("draggable","zIndex",{start:function(e,n){var i=t(n.helper),o=t(this).data("ui-draggable").options;i.css("zIndex")&&(o._zIndex=i.css("zIndex")),i.css("zIndex",o.zIndex)},stop:function(e,n){var i=t(this).data("ui-draggable").options;i._zIndex&&t(n.helper).css("zIndex",i._zIndex)}})}(jQuery),/*
* jQuery UI Tag-it!
*
* @version v2.0 (06/2011)
*
* Copyright 2011, Levy Carneiro Jr.
* Released under the MIT license.
* http://aehlke.github.com/tag-it/LICENSE
*
* Homepage:
*   http://aehlke.github.com/tag-it/
*
* Authors:
*   Levy Carneiro Jr.
*   Martin Rehfeld
*   Tobias Schmidt
*   Skylar Challand
*   Alex Ehlke
*
* Maintainer:
*   Alex Ehlke - Twitter: @aehlke
*
* Dependencies:
*   jQuery v1.4+
*   jQuery UI v1.8+
*/
function(t){t.widget("ui.tagit",{options:{itemName:"item",fieldName:"tags",availableTags:[],tagSource:null,removeConfirmation:!1,caseSensitive:!0,placeholderText:null,allowSpaces:!1,animate:!0,singleField:!1,singleFieldDelimiter:",",singleFieldNode:null,tabIndex:null,inputClasses:"",onTagAdded:null,onTagRemoved:null,onTagClicked:null},_create:function(){var e=this;if(this.element.is("input")?(this.tagList=t("<ul></ul>").insertAfter(this.element),this.options.singleField=!0,this.options.singleFieldNode=this.element,this.element.css("display","none")):this.tagList=this.element.find("ul, ol").andSelf().last(),this._tagInput=t('<input type="text" />').addClass("ui-widget-content "+this.options.inputClasses),this.options.tabIndex&&this._tagInput.attr("tabindex",this.options.tabIndex),this.options.placeholderText&&this._tagInput.attr("placeholder",this.options.placeholderText),this.options.tagSource=this.options.tagSource||function(e,n){var i=e.term.toLowerCase(),o=t.grep(this.options.availableTags,function(t){return 0===t.toLowerCase().indexOf(i)});n(this._subtractArray(o,this.assignedTags()))},t.isFunction(this.options.tagSource)&&(this.options.tagSource=t.proxy(this.options.tagSource,this)),this.tagList.addClass("tagit").addClass("ui-widget ui-widget-content ui-corner-all").append(t('<li class="tagit-new"></li>').append(this._tagInput)).click(function(n){var i=t(n.target);i.hasClass("tagit-label")?e._trigger("onTagClicked",n,i.closest(".tagit-choice")):e._tagInput.focus()}),this.tagList.children("li").each(function(){t(this).hasClass("tagit-new")||(e.createTag(t(this).html(),t(this).attr("class")),t(this).remove())}),this.options.singleField)if(this.options.singleFieldNode){var n=t(this.options.singleFieldNode),i=n.val().split(this.options.singleFieldDelimiter);n.val(""),t.each(i,function(t,n){e.createTag(n)})}else this.options.singleFieldNode=this.tagList.after('<input type="hidden" style="display:none;" value="" name="'+this.options.fieldName+'" />');this._tagInput.keydown(function(n){if(n.which==t.ui.keyCode.BACKSPACE&&""===e._tagInput.val()){var i=e._lastTag();!e.options.removeConfirmation||i.hasClass("remove")?e.removeTag(i):e.options.removeConfirmation&&i.addClass("remove ui-state-highlight")}else e.options.removeConfirmation&&e._lastTag().removeClass("remove ui-state-highlight");(n.which==t.ui.keyCode.COMMA||n.which==t.ui.keyCode.ENTER||n.which==t.ui.keyCode.TAB&&""!==e._tagInput.val()||n.which==t.ui.keyCode.SPACE&&e.options.allowSpaces!==!0&&('"'!=t.trim(e._tagInput.val()).replace(/^s*/,"").charAt(0)||'"'==t.trim(e._tagInput.val()).charAt(0)&&'"'==t.trim(e._tagInput.val()).charAt(t.trim(e._tagInput.val()).length-1)&&0!==t.trim(e._tagInput.val()).length-1))&&(n.preventDefault(),e.createTag(e._cleanedInput()),e._tagInput.autocomplete("close"))}).blur(function(){e.createTag(e._cleanedInput())}),(this.options.availableTags||this.options.tagSource)&&this._tagInput.autocomplete({source:this.options.tagSource,select:function(t,n){return""===e._tagInput.val()&&e.removeTag(e._lastTag(),!1),e.createTag(n.item.value),!1}})},_cleanedInput:function(){return t.trim(this._tagInput.val().replace(/^"(.*)"$/,"$1"))},_lastTag:function(){return this.tagList.children(".tagit-choice:last")},assignedTags:function(){var e=this,n=[];return this.options.singleField?(n=t(this.options.singleFieldNode).val().split(this.options.singleFieldDelimiter),""===n[0]&&(n=[])):this.tagList.children(".tagit-choice").each(function(){n.push(e.tagLabel(this))}),n},_updateSingleTagsField:function(e){t(this.options.singleFieldNode).val(e.join(this.options.singleFieldDelimiter))},_subtractArray:function(e,n){for(var i=[],o=0;o<e.length;o++)-1==t.inArray(e[o],n)&&i.push(e[o]);return i},tagLabel:function(e){return this.options.singleField?t(e).children(".tagit-label").text():t(e).children("input").val()},_isNew:function(t){var e=this,n=!0;return this.tagList.children(".tagit-choice").each(function(){return e._formatStr(t)==e._formatStr(e.tagLabel(this))?(n=!1,!1):void 0}),n},_formatStr:function(e){return this.options.caseSensitive?e:t.trim(e.toLowerCase())},createTag:function(e,n){var i=this;if(e=t.trim(e),!this._isNew(e)||""===e)return!1;var o=t(this.options.onTagClicked?'<a class="tagit-label"></a>':'<span class="tagit-label"></span>').text(e),r=t("<li></li>").addClass("tagit-choice ui-widget-content ui-state-default ui-corner-all").addClass(n).append(o),s=t("<span></span>").addClass("ui-icon ui-icon-close"),a=t('<a><span class="text-icon">×</span></a>').addClass("tagit-close").append(s).click(function(){i.removeTag(r)});if(r.append(a),this.options.singleField){var l=this.assignedTags();l.push(e),this._updateSingleTagsField(l)}else{var c=o.html();r.append('<input type="hidden" style="display:none;" value="'+c+'" name="'+this.options.itemName+"["+this.options.fieldName+'][]" />')}this._trigger("onTagAdded",null,r),this._tagInput.val(""),this._tagInput.parent().before(r)},removeTag:function(e,n){if(n=n||this.options.animate,e=t(e),this._trigger("onTagRemoved",null,e),this.options.singleField){var i=this.assignedTags(),o=this.tagLabel(e);i=t.grep(i,function(t){return t!=o}),this._updateSingleTagsField(i)}n?e.fadeOut("fast").hide("blind",{direction:"horizontal"},"fast",function(){e.remove()}).dequeue():e.remove()},removeAll:function(){var t=this;this.tagList.children(".tagit-choice").each(function(e,n){t.removeTag(n,!1)})}})}(jQuery),function(){}.call(this);