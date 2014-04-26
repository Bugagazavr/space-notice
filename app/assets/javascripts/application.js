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

  $(".autosave").on("submit", function(){
    var form = $(this)
    var name = form.find("input[name='project[name]']")
    if (name.val().length == 0) {
      name.val("Application X")
    }
    $.ajax({
      type: "POST",
      url: form.prop("action"),
      data: form.serialize()
    });
    return false
  })

  $(".autosave :input").on("blur", function(){
    var form = $(this).closest("form")
    form.submit()
  })
});
