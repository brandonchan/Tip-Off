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
      firstTeam = games[0].oppoteam;
      diff = futureDate.getTime() / 1000 - currentDate.getTime() / 1000;
      clock = $('.clock').FlipClock(diff, {
        clockFace: 'DailyCounter',
        countdown: true
      });
      teamHeader = new Vue
          el: '#teamHeader',
          data:
              firstTeam: firstTeam

      seatgeek = new Vue
          el: '#seatgeekPrices',
          data:
              games: games
    error: ->
      console.log(error)
    dataType: 'json'

  $.ajax
    url: '/stubhub',
    method: 'GET',
    success: (data, status, response) ->
      events = JSON.parse(response.responseText)
      console.log(events)
      stubhub = new Vue
          el: '#stubhubPrices',
          data:
              events: events
    error: ->
      console.log(error)
    dataType: 'json'



