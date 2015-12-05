$ ->
  console.log('hi')
  $.ajax
    url: '/games',
    method: 'GET',
    success: (data, status, response) ->
      games = JSON.parse(response.responseText)
      new Vue
          el: '#seatgeekPrices',
          data:
              games: games
      new Vue
          el: '#stubhubPrices',
          data:
              games: games
    error: ->
      console.log(error)
    dataType: 'json'



