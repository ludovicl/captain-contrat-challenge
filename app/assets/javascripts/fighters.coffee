# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setHardcore = -> $(".navbar").addClass('hardcore')
removeHardcore = -> $(".navbar").removeClass('hardcore')

$(document)
  .on "turbolinks:load", ->
    isHardcore = localStorage.getItem("hardcore")
    if isHardcore == "true"
      setHardcore()
  .on "click", "#hardcore", ->
    isHardcore = localStorage.getItem("hardcore")
    if isHardcore != "true"
      setHardcore()
      localStorage.setItem("hardcore","true")
    else
      removeHardcore()
      localStorage.setItem("hardcore","false")

