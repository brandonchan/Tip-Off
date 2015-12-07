class TeamController < ApplicationController
  def index
    #print out all games coming up
    #print current record
    #print game choices

  end

  def games

    @events = []
    response = HTTParty.get("http://api.seatgeek.com/2/events?performers.slug=golden-state-warriors")
    games = response['events']
    games.each do |game|
      @events << {title: game['title'], lowest_price: game['stats']['lowest_price'], url: game['url'], datetime_utc: game['datetime_utc'], location: game['venue']['extended_address'], venue: game['venue']['name']}
    end
    render json: @events
  end

  def stubhub
    @meat = Stubhub::Venue.search("Golden State Warriors")
    render json: @meat
  end
end
