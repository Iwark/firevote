#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$ ()->
  $(".vote-form").on 'submit', () ->
    $("#firecanvas").css("display", "block")
    vote()