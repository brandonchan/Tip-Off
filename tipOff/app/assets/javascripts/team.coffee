$ ->
  console.log('hi')
  $.ajax
    url: '/games',
    method: 'GET',
    success: (data, status, response) ->
      games = JSON.parse(response.responseText)
      nextGameTime = games[0].datetime_utc
      currentDate = new Date();
      futureDate  = new Date(nextGameTime);
      diff = futureDate.getTime() / 1000 - currentDate.getTime() / 1000;
      clock = $('.clock').FlipClock(diff, {
        clockFace: 'DailyCounter',
        countdown: true
      });
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



