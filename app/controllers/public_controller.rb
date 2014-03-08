require 'json'
FlickRaw.api_key="5f6652a08b32dd50ae264fb3f47a9632"
FlickRaw.shared_secret="6826da1b61cf3f39"

class PublicController < ApplicationController
  def random
    num_items = Item.count
    offset = rand(num_items)    
    @item = Item.first(:offset => offset)
    
    num_photos = 5
    photos = flickr.photos.search :tags => @item.category, :per_page => num_photos
    
    #build url, format = http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    index = rand(num_photos)
    farm_id = photos[index]["farm"].to_s
    server_id = photos[index]["server"]
    id = photos[index]["id"]
    secret = photos[index]["secret"]
    @image_url = "http://farm" + farm_id + ".staticflickr.com/" + server_id + "/" + id + "_" + secret + ".jpg"
  end
end
