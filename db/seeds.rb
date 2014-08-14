# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

flatiron = Community.create(name: "Flatiron School", latitude: 40.705397, longitude: -74.013924)

sophies = flatiron.restaurants.create(name: "Sophie's", category: "Cuban", yelp_url: "http://www.yelp.com/biz/sophies-cuban-cuisine-new-york-8", address: "73 New St", latitude: 40.705421, longitude: -74.012522, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/MZowS0PsRVmOyn6yksjeTQ/l.jpg')
chipotle = flatiron.restaurants.create(name: "Chipotle", category: "Mexican", yelp_url: "http://www.yelp.com/biz/chipotle-mexican-grill-new-york-30", address: "2 Broadway", latitude: 40.704499, longitude: -74.012825, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/udIMvXLKSXt4NIQRSgY5_g/l.jpg')
flavors = flatiron.restaurants.create(name: "Flavors", category: "Salad/Sandwiches", yelp_url: "http://www.yelp.com/biz/flavors-new-york", address: "27 Whitehall St", latitude: 40.704649, longitude: -74.011790, image_url: 'http://s3-media3.fl.yelpcdn.com/bphoto/cB6ieKowle5xPudpEW5jkg/l.jpg')
yips = flatiron.restaurants.create(name: "Yips Restaurant", category: "Chinese", yelp_url: "http://www.yelp.com/biz/yips-restaurant-new-york", address: "18 Beaver St", latitude: 40.704994, longitude: -74.012389, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/HJH5xf_bN2iPcxoQjYwn2w/l.jpg')

brandon = flatiron.members.create(name: "Brandon Hopkins", email: "bh@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
peter = flatiron.members.create(name: "Peter Glennon", email: "pg@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
jess = flatiron.members.create(name: "Jess Rudder", email: "jr@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 2)
simon = flatiron.members.create(name: "Simon Seroussi", email: "ss@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 1)
chris = flatiron.members.create(name: "Chris Callahan", email: "chris@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 4)
michael = flatiron.members.create(name: "Michael Loker", email: "michael@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
jacob = flatiron.members.create(name: "Jacob Barriaeult", email: "jacob@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 3)
amy = flatiron.members.create(name: "Amy Johnson", email: "amy@foo.com", password: "password1234", password_confirmation: "password1234", group_id: 2)

sophies_group = Group.create(time: "2000-01-01 12:40:00", community_id: 1, restaurant_id: 1)
chipotle_group = Group.create(time: "2000-01-01 13:00:00", community_id: 1, restaurant_id: 2)
flavors_group = Group.create(time: "2000-01-01 12:00:00", community_id: 1, restaurant_id: 3)
yips_group = Group.create(time: "2000-01-01 12:20:00", community_id: 1, restaurant_id: 4)

brandon.reviews.create(restaurant: sophies, rating: 5, text: "Awesome Cuban food in huge portions--it takes a lot of willpower not to eat an entire meal in one sitting, rather than doing the responsible thing and saving half for dinner.")
brandon.reviews.create(restaurant: chipotle, rating: 3, text: "Classic standby for when you leave the school without figuring out what you want for lunch.")
brandon.reviews.create(restaurant: flavors, rating: 4, text: "Lots of variety. Their specialty is their quinoa bowls with all kinds of mixins.")

peter.reviews.create(restaurant: sophies, rating: 4, text: "A little sketched out by the meat.")
peter.reviews.create(restaurant: flavors, rating: 3, text: "My fallback lunch place.")

jess.reviews.create(restaurant: chipotle, rating: 4, text: "Sometimes you just gotta go to Chipotle.")

simon.reviews.create(restaurant: chipotle, rating: 4, text: "They're super annoying (what's it called?).  Oh, the sneeze guard.  Assholes.")

chris.reviews.create(restaurant: yips, rating: 4, text: "Great value, gotta love the ribs with black bean sauce. The two ladies who work there are super nice! :)")