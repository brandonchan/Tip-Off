class TeamController < ApplicationController
  require 'open-uri'
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
      @events << {title: game['title'], oppoteam: game['performers'][0]['name'], lowest_price: game['stats']['lowest_price'], url: game['url'], datetime_utc: game['datetime_utc'], location: game['venue']['extended_address'], venue: game['venue']['name']}
    end
    render json: @events
  end

  def stubhub
    uri = "http://www.stubhub.com/listingCatalog/select?q=stubhubDocumentType:event%20AND%20description:%22golden%20state%20warriors%22"
    response = Nokogiri::XML(open(uri))

    numEvents = response.xpath('//doc').length
    @stubhub = []

    i = 0
    while i < numEvents
        minPrice = response.xpath('//float[@name="minPrice"]')[i].children.text
        urlPath = response.xpath('//str[@name="urlpath"]')[i].children.text
        eventDate = response.xpath('//date[@name="event_date"]')[i].children.text
        @stubhub << {minPrice: minPrice, urlPath: urlPath, eventDate: eventDate}
        i += 1
    end
    render json: @stubhub
  end
end
