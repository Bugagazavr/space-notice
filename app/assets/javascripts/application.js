//= require jquery
//= require jquery_ujs
//= require typed
//= require_tree .


$(function(){
  $(".typed").each(function(i, html){
    var string = $(html).text()
    $(html).text("")

    setTimeout(function(){
      $(html).typed({
        strings: [string],
        typeSpeed: 1
      })
    }, 300)
  })
});
