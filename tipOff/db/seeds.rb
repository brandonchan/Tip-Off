require 'open-uri'
require 'nokogiri'

uri = "http://www.stubhub.com/listingCatalog/select?q=stubhubDocumentType:event%20AND%20description:%22golden%20state%20warriors%22"
    response = Nokogiri::XML(open(uri))

    numEvents = response.xpath('//doc').length
    @stubhub=[]
    i = 0
    while i < numEvents
        act_primary = response.xpath('//str[@name="act_primary"]')[i].children.text
        act_secondary = response.xpath('//str[@name="act_secondary"]')[i].children.text
        title = response.xpath('//str[@name="seo_description"]')[i].children.text
        minPrice = response.xpath('//float[@name="minPrice"]')[i].children.text
        minPrice = minPrice.to_i
        urlPath = response.xpath('//str[@name="urlpath"]')[i].children.text
        urlPath = "https://www.stubhub.com/#{urlPath}"
        eventDate = response.xpath('//date[@name="event_date"]')[i].children.text
        @stubhub << {price: minPrice, url: urlPath, date: eventDate, title: title, primary: act_primary, secondary: act_secondary}
        i += 1
    end

stubhubSeed = Stubhub.create(@stubhub)
