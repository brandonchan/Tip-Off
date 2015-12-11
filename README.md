# Tip-Off
(MVP)
Compare ticket prices to the sought out Warriors home games.  
Using prices found on stubhub and the seatgeek api.  
Link to each game so you can buy tickets.  
This app is constructed with VueJS for databinding purposes.  
Used Bootstrap for the grid system.  
FlipclockJS for the countdown timer.  
(reach goals)  
Write some legit tests.  
Have a popup so you can purchase without leaving the site.  
Open app to query for all events not just warriors games.  
Find more API's so you can find cheaper prices elsewhere.  

Troubles
Seatgeek only provides 10 games through their api.  In order to maintain similarity. I'm only going to show 10 for stubhub and (REACH) hopefully get to a point where I can list more from the stubhub on scroll or click.

Notes on Nokogiri and the Stubhub API. 
http://www.stubhub.com/listingCatalog/select?q=stubhubDocumentType:event AND description:"golden state warriors"
Stubhub provides and API but the api to find listings is online.  In my case of this project, my query is for Warriors games only.  Home and away to hit my mvp quicker. List any event in that string and it will bring up the query in XML.  

Nokogiri::XML(open('url'))

```
<str name="type_id">0</str>
```  
Most of stubhub's XML is provided in the str component with name as it's attriubte.  On every event it will bring up at least 100+ items with the attribute name. So Using nokogiri gets pretty messy.

XML I needed to Query For

```
<float name="minPrice">74.27</float>
str name="urlpath">sacramento-kings-sacramento-sleep-train-arena-11-7-2015-9371517</str>

``
