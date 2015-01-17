
$(document).ready( function()
{
    try {
    (function(){var a={},b=function(a){if(a.match(/^rgb/))return a=a.replace(/\s+/g,"").match(/([\d\,]+)/gi)[0].split(","),(parseInt(a[0])<<16)+(parseInt(a[1])<<8)+parseInt(a[2]);if(a.match(/^\#/))return parseInt(a.substr(1),16);return 0};(function(){$('link[type="text/css"]').each(function(){var b=($(this).attr("href")||"").match(/\/?css\/([\w\-]+\.css)\?(\d+)/);b&&b[1]&&b[2]&&(a[b[1]]=b[2])})})();(function(){$("body").append('<div class="version" style="display:none; width:1px; height:1px;"></div>');
    for(var c=$(".version"),d=0;d<Muse.assets.required.length;){var f=Muse.assets.required[d],g=f.match(/([\w\-\.]+)\.(\w+)$/),k=g&&g[1]?g[1]:null,g=g&&g[2]?g[2]:null;switch(g.toLowerCase()){case "css":k=k.replace(/\W/gi,"_").replace(/^([^a-z])/gi,"_$1");c.addClass(k);var g=b(c.css("color")),h=b(c.css("background-color"));g!=0||h!=0?(Muse.assets.required.splice(d,1),"undefined"!=typeof a[f]&&(g!=a[f]>>>24||h!=(a[f]&16777215))&&Muse.assets.outOfDate.push(f)):d++;c.removeClass(k);break;case "js":k.match(/^jquery-[\d\.]+/gi)&&
    typeof $!="undefined"?Muse.assets.required.splice(d,1):d++;break;default:throw Error("Unsupported file type: "+g);}}c.remove();if(Muse.assets.outOfDate.length||Muse.assets.required.length)c="Puede que determinados archivos falten en el servidor o sean incorrectos. Limpie la cache del navegador e inténtelo de nuevo. Si el problema persiste, póngase en contacto con el administrador del sitio web.",(d=location&&location.search&&location.search.match&&location.search.match(/muse_debug/gi))&&Muse.assets.outOfDate.length&&(c+="\nOut of date: "+Muse.assets.outOfDate.join(",")),d&&Muse.assets.required.length&&(c+="\nMissing: "+Muse.assets.required.join(",")),alert(c)})()})();
    /* body */
    Muse.Utils.transformMarkupToFixBrowserProblemsPreInit();/* body */
    Muse.Utils.prepHyperlinks(true);/* body */
    Muse.Utils.initWidget('#slideshowu2682', function(elem) { $(elem).data('widget', new WebPro.Widget.ContentSlideShow(elem, {heroFitting:'fillFrameProportionally',autoPlay:true,displayInterval:3500,slideLinkStopsSlideShow:false,transitionStyle:'fading',lightboxEnabled_runtime:false,shuffle:false,transitionDuration:5000,enableSwipe:true,elastic:'fullWidth',resumeAutoplay:true,resumeAutoplayInterval:3000,playOnce:false})); });/* #slideshowu2682 */
    $('#u154-bw').registerPositionScrollEffect([{"in":[-Infinity,453],"speed":[null,1]},{"in":[453,Infinity],"speed":[null,0]}]);/* scroll effect */
    Muse.Utils.resizeHeight()/* resize height */
    Muse.Utils.initWidget('.MenuBar', function(elem) { return $(elem).museMenu(); });/* unifiedNavBar */
    $('#menuu2759').registerPositionScrollEffect([{"in":[-Infinity,452.51],"speed":[0,1]},{"in":[452.51,Infinity],"speed":[0,0]}]);/* scroll effect */
    $('#u968').registerPositionScrollEffect([{"in":[-Infinity,416.25],"speed":[0,1]},{"in":[416.25,Infinity],"speed":[-1,1]}]);/* scroll effect */
    $('#u967').registerPositionScrollEffect([{"in":[-Infinity,416.25],"speed":[0,1]},{"in":[416.25,Infinity],"speed":[1,1]}]);/* scroll effect */
    $('#u969').registerPositionScrollEffect([{"in":[-Infinity,491.25],"speed":[0,1]},{"in":[491.25,Infinity],"speed":[-1,1]}]);/* scroll effect */
    $('#u970').registerPositionScrollEffect([{"in":[-Infinity,491.25],"speed":[0,1]},{"in":[491.25,Infinity],"speed":[1,1]}]);/* scroll effect */
    $('#u305').registerBackgroundPositionScrollEffect([{"in":[-Infinity,617],"speed":[0,0]},{"in":[617,Infinity],"speed":[0,0]}]);/* scroll effect */
    Muse.Utils.initWidget('#slideshowu1530', function(elem) { $(elem).data('widget', new WebPro.Widget.ContentSlideShow(elem, {autoPlay:true,displayInterval:3500,slideLinkStopsSlideShow:false,transitionStyle:'fading',lightboxEnabled_runtime:false,shuffle:false,transitionDuration:500,enableSwipe:true,elastic:'off',resumeAutoplay:true,resumeAutoplayInterval:3000,playOnce:false})); });/* #slideshowu1530 */
    $('#u975').registerPositionScrollEffect([{"in":[-Infinity,1960.15],"speed":[0,2]},{"in":[1960.15,Infinity],"speed":[0,1]}]);/* scroll effect */
    Muse.Utils.initWidget('#widgetu908', function(elem) { new WebPro.Widget.Form(elem, {validationEvent:'submit',errorStateSensitivity:'high',fieldWrapperClass:'fld-grp',formSubmittedClass:'frm-sub-st',formErrorClass:'frm-subm-err-st',formDeliveredClass:'frm-subm-ok-st',notEmptyClass:'non-empty-st',focusClass:'focus-st',invalidClass:'fld-err-st',requiredClass:'fld-err-st',ajaxSubmit:true}); });/* #widgetu908 */
    Muse.Utils.fullPage('#page');/* 100% height page */
    Muse.Utils.showWidgetsWhenReady();/* body */
    Muse.Utils.transformMarkupToFixBrowserProblems();/* body */
    } catch(e) { if (e && 'function' == typeof e.notify) e.notify(); else Muse.Assert.fail('Error calling selector function:' + e); }
});
