$ ->
  console.log('hi')
  $.ajax
    url: '/games',
    method: 'GET',
    success: (data, status, response) ->
      games = JSON.parse(response.responseText)
      gameTime = new Vue
          el: '#gameTime',
          data:
              time: games[0].local_time
      console.log(gameTime.time)
      seatgeek = new Vue
          el: '#seatgeekPrices',
          data:
              games: games
      stubhub = new Vue
          el: '#stubhubPrices',
          data:
              games: games
    error: ->
      console.log(error)
    dataType: 'json'



