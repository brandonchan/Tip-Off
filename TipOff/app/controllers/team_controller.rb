class TeamController < ApplicationController
  def index
    #print out all games coming up
    #print current record
    #print game choices
    response = HTTParty.get("http://api.seatgeek.com/2/events?performers.slug=golden-state-warriors")
    p response['events'][0]
  end
end
