$ ->
  console.log('hi')
  $.ajax
    url: 'http://localhost:3000/games',
    method: 'GET',
    success: (data, status, response) ->
      gameResponse = JSON.parse(response.responseText)
    error: ->
      console.log(error)
    dataType: 'json'

