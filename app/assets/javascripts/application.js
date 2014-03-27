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

  $(".autosave :input").on("blur", function(){
    var form = $(this).closest("form")
    var name = form.find("input[name='project[name]']")
    if (name.val().length > 0) {
      $.ajax({
        type: "POST",
        url: form.prop("action"),
        data: form.serialize()
      });
    } else {
      if (confirm("Do you want to delete the project?")) {
        $.ajax({
          type: "DELETE",
          url: form.prop("action"),
          success: function(){
            form.closest(".projects-list-item").remove()
          }
        });
      } else {
        name.val("Application X")
      }
    }
  })
});
