class Stubhub < ActiveRecord::Base
  def self.update
    @shown_games = []
    @remaning_games=[]
    uri = "https://stubhub.com/"
    stubhub_obj = Stubhub.order(:date)
    stubhub_obj.each do |game|
      if game.date > DateTime.now
        @remaning_games << game
      end
    end

    response = Nokogiri::XML(open("http://www.stubhub.com/listingCatalog/select?q=stubhubDocumentType:event%20AND%20description:%22golden%20state%20warriors%22"))
    numEvents = response.xpath('//doc').length
    @price_update =  []
    i = 0
    while i < numEvents
      title = response.xpath('//str[@name="seo_description"]')[i].children.text
      minPrice = response.xpath('//float[@name="minPrice"]')[i].children.text
      minPrice = minPrice.to_i

      @price_update << {price: minPrice, title: title}
      i += 1
    end

    @remaning_games.each do |game|
      @price_update.each do |price|
        if price[:title] == game['title']
          game.update(price: price[:price])
        end
      end
    end
  end
end
