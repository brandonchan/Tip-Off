require 'open-uri'
require 'nokogiri'

uri = "http://www.stubhub.com/listingCatalog/select?q=stubhubDocumentType:event%20AND%20description:%22golden%20state%20warriors%22"
    response = Nokogiri::XML(open(uri))

    numEvents = response.xpath('//doc').length
    @stubhub=[]
    i = 0
    while i < numEvents
        title = response.xpath('//str[@name="seo_description"]')[i].children.text
        venue = response.xpath('//str[@name="eventGeoDescription"]')[i].children.text
        city = response.xpath('//str[@name="city"]')[i].children.text
        state = response.xpath('//str[@name="state"]')[i].children.text
        location = "#{city}, #{state}"
        minPrice = response.xpath('//float[@name="minPrice"]')[i].children.text
        minPrice = minPrice.to_i
        urlPath = response.xpath('//str[@name="urlpath"]')[i].children.text
        urlPath = "https://www.stubhub.com/#{urlPath}"
        eventDate = response.xpath('//date[@name="event_date"]')[i].children.text
        @stubhub << {price: minPrice, url: urlPath, date: eventDate, title: title, location: location, venue: venue}
        i += 1
    end

stubhubSeed = Stubhub.create(@stubhub)
