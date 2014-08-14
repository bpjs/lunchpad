# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# The Flatiron School + Gluten-Free Flatiron

flatiron = Community.create(name: "Flatiron School", latitude: 40.705397, longitude: -74.013924)

sophies = flatiron.restaurants.create(name: "Sophie's", category: "Cuban", yelp_url: "http://www.yelp.com/biz/sophies-cuban-cuisine-new-york-8", address: "73 New St", latitude: 40.705421, longitude: -74.012522, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/MZowS0PsRVmOyn6yksjeTQ/l.jpg')
chipotle = flatiron.restaurants.create(name: "Chipotle", category: "Mexican", yelp_url: "http://www.yelp.com/biz/chipotle-mexican-grill-new-york-30", address: "2 Broadway", latitude: 40.704499, longitude: -74.012825, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/udIMvXLKSXt4NIQRSgY5_g/l.jpg')
flavors = flatiron.restaurants.create(name: "Flavors", category: "Salad/Sandwiches", yelp_url: "http://www.yelp.com/biz/flavors-new-york", address: "27 Whitehall St", latitude: 40.704649, longitude: -74.011790, image_url: 'http://s3-media3.fl.yelpcdn.com/bphoto/cB6ieKowle5xPudpEW5jkg/l.jpg')
yips = flatiron.restaurants.create(name: "Yips Restaurant", category: "Chinese", yelp_url: "http://www.yelp.com/biz/yips-restaurant-new-york", address: "18 Beaver St", latitude: 40.704994, longitude: -74.012389, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/HJH5xf_bN2iPcxoQjYwn2w/l.jpg')

sophies_group = Group.create(time: "2000-01-01 12:40:00", community_id: 1, restaurant_id: 1)
chipotle_group = Group.create(time: "2000-01-01 13:00:00", community_id: 1, restaurant_id: 2)
flavors_group = Group.create(time: "2000-01-01 12:00:00", community_id: 1, restaurant_id: 3)
yips_group = Group.create(time: "2000-01-01 12:20:00", community_id: 1, restaurant_id: 4)

brandon = flatiron.members.create(name: "Brandon Hopkins", email: "bh@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
peter = flatiron.members.create(name: "Peter Glennon", email: "pg@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
jess = flatiron.members.create(name: "Jess Rudder", email: "jr@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 2)
simon = flatiron.members.create(name: "Simon Seroussi", email: "ss@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
chris = flatiron.members.create(name: "Chris Callahan", email: "chris@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 4)
michael = flatiron.members.create(name: "Michael Loker", email: "michael@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
jacob = flatiron.members.create(name: "Jacob Barriaeult", email: "jacob@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
amy = flatiron.members.create(name: "Amy Johnson", email: "amy@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 2)
ashley = flatiron.members.create(name: "Ashley Blewer", email: "ashley@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
rebecca = flatiron.members.create(name: "Rebecca Greenblatt", email: "rebecca@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
vanessa = flatiron.members.create(name: "Vanessa Dean", email: "vanessa@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 4)

gf_at_flatiron = Community.create(name: "Gluten-Free Flatiron", latitude: flatiron.latitude, longitude: flatiron.longitude)

dig_inn = gf_at_flatiron.restaurants.create(name: "Dig Inn Seasonal Market", category: "American (Traditional)", yelp_url: "http://www.yelp.com/biz/dig-inn-seasonal-market-new-york-5", address: "80 Pine St", latitude: 40.706108, longitude: -74.006815, image_url: "http://s3-media1.fl.yelpcdn.com/bphoto/9Ia1oQ9-ZQWFh7VCBmweRA/l.jpg")

gf_at_flatiron.members << [peter, ashley, rebecca]
gf_at_flatiron.save

brandon.reviews.create(restaurant: sophies, rating: 5, text: "Awesome Cuban food in huge portions--it takes a lot of willpower not to eat an entire meal in one sitting, rather than doing the responsible thing and saving half for dinner.")
brandon.reviews.create(restaurant: chipotle, rating: 3, text: "Classic standby for when you leave the school without figuring out what you want for lunch.")
brandon.reviews.create(restaurant: flavors, rating: 4, text: "Lots of variety. Their specialty is their quinoa bowls with all kinds of mixins.")

peter.reviews.create(restaurant: sophies, rating: 4, text: "I love this place, especially when they have Ropa Vieja.  But I always feel a little for about 30 minutes after eating there.")
peter.reviews.create(restaurant: chipotle, rating: 4, text: "It's a Chipotle, do you really need a review?  Just go before 11:45 or after 2:30 unless you like waiting in line for ~15 minutes.")
peter.reviews.create(restaurant: flavors, rating: 3, text: "Fallback lunch place.  You know what you're getting: it's not fantastic, but consistently pretty good.")

jess.reviews.create(restaurant: chipotle, rating: 4, text: "The line is intimidating at lunch time, but you can get through it in about 15 minutes.  Definitely worth it when you're craving some spicy food.")
jess.reviews.create(restaurant: yips, rating: 2, text: "There were not a lot of options for vegetarians.  I did enjoy the free can of Mountain Dew included with the meal though.")
jess.reviews.create(restaurant: flavors, rating: 3, text: "The ingredients seem nice, but every time I go I manage to make a horrible mix. I should stick to prefab salads.")

chris.reviews.create(restaurant: yips, rating: 4, text: "Great value, gotta love the ribs with black bean sauce. The two ladies who work there are super nice! :)")

# The Bluth Company

the_bluth_company = Community.create(name: "The Bluth Company", latitude: 33.6220717, longitude: -117.9249228)

banana_stand = the_bluth_company.restaurants.create(name: "Bluth Banana Stand", category: "Frozen Bananas", latitude: 33.6202899, longitude: -117.925062)
klimpys = the_bluth_company.restaurants.create(name: "Klimpy's", category: "Casual/Mediocre", latitude: 33.6198698, longitude: -117.9244449)
burger_king = the_bluth_company.restaurants.create(name: "Burger King", category: "Fast Food", latitude: 33.6186957, longitude: -117.9197717)

michael = the_bluth_company.members.create(name: "Michael Bluth", email: "michael@bluth.com", password: "password1234", password_confirmation: "password1234")
gob = the_bluth_company.members.create(name: "Gob Bluth", email: "gob@bluth.com", password: "password1234", password_confirmation: "password1234")
tobias = the_bluth_company.members.create(name: "Tobias Fünke", email: "mister_f@bluth.com", password: "password1234", password_confirmation: "password1234")
kitty = the_bluth_company.members.create(name: "Kitty Sanchez", email: "kitty@bluth.com", password: "password1234", password_confirmation: "password1234")

gob.reviews.create(restaurant: banana_stand, rating: 3, text: "No double dip?? C'mon!!")
michael.reviews.create(restaurant: banana_stand, rating: 5, text: "Just check for money in the walls before burning it down.")
tobias.reviews.create(restaurant: burger_king, rating: 5, text: "It's a wonderful restaurant.")