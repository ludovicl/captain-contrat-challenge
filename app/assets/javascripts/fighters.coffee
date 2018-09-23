# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document)
  .on "turbolinks:load", ->
    is_hardcore = localStorage.getItem("hardcore")
    if is_hardcore == "true"
      $(".navbar").addClass('hardcore')
  .on "click", "#hardcore", ->
    is_hardcore = localStorage.getItem("hardcore")
    if is_hardcore != "true"
      $(".navbar").addClass('hardcore')
      localStorage.setItem("hardcore","true")
    else
      $(".navbar").removeClass('hardcore')
      localStorage.setItem("hardcore","false")

