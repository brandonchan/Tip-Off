class TeamController < ApplicationController
  require 'open-uri'
  def index
    #print out all games coming up
    #print current record
    #print game choices
    Stubhub.update()
  end

  def games
    @events = []
    response = HTTParty.get("http://api.seatgeek.com/2/events?performers.slug=golden-state-warriors")
    games = response['events']
    games.each do |game|
      @events << {title: game['title'], oppoteam: game['performers'][0]['name'], lowest_price: game['stats']['lowest_price'], url: game['url'], datetime_utc: game['datetime_utc'], location: game['venue']['extended_address'], venue: game['venue']['name']}
    end
    render json: @events
  end

  def stubhub
    @remaning_games=[]
    stubhub_obj = Stubhub.order(:date)
    stubhub_obj.each do |game|
      if game.date > DateTime.now
        @remaning_games << game
      end
    end
    render json: @remaning_games
  end
end
