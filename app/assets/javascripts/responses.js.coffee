# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if document.location.hash
    name = document.location.hash.replace('#', '').downcase()
    if DSYV.candidateNameMap.hasOwnProperty(name)
      console.log DSYV
      $('#candidate_name').html(DSYV.candidateNameMap[name])
      $('#response_who').val(name)
    else
      document.location = "/"
