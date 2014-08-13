# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

flatiron = Community.create(name: "Flatiron School", latitude: 40.705397, longitude: -74.013924)

sophies = flatiron.restaurants.create(name: "Sophie's", category: "Cuban", yelp_url: "http://www.yelp.com/biz/sophies-cuban-cuisine-new-york-8", address: "73 New St", latitude: 40.705421, longitude: -74.012522, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/MZowS0PsRVmOyn6yksjeTQ/l.jpg')
chipotle = flatiron.restaurants.create(name: "Chipotle", category: "Mexican", yelp_url: "http://www.yelp.com/biz/chipotle-mexican-grill-new-york-30", address: "2 Broadway", latitude: 40.704499, longitude: -74.012825, image_url: 'http://s3-media4.fl.yelpcdn.com/bphoto/udIMvXLKSXt4NIQRSgY5_g/l.jpg')
flavors = flatiron.restaurants.create(name: "Flavors", category: "Salad/Sandwiches", yelp_url: "http://www.yelp.com/biz/flavors-new-york", address: "27 Whitehall St", latitude: 40.704649, longitude: -74.011790, image_url: 'http://s3-media3.fl.yelpcdn.com/bphoto/cB6ieKowle5xPudpEW5jkg/l.jpg')

brandon = flatiron.members.create(name: "Brandon Hopkins", email: "bh@foo.com", password: "password1234", password_confirmation: "password1234")
peter = flatiron.members.create(name: "Peter Glennon", email: "pg@foo.com", password: "password1234", password_confirmation: "password1234")
jess = flatiron.members.create(name: "Jess Rudder", email: "jr@foo.com", password: "password1234", password_confirmation: "password1234")
simon = flatiron.members.create(name: "Simon Seroussi", email: "ss@foo.com", password: "password1234", password_confirmation: "password1234")

brandon.reviews.create(restaurant: sophies, rating: 5, text: "Awesome Cuban food in huge portions--it takes a lot of willpower not to eat an entire meal in one sitting, rather than doing the responsible thing and saving half for dinner.")
brandon.reviews.create(restaurant: chipotle, rating: 3, text: "Classic standby for when you leave the school without figuring out what you want for lunch.")
brandon.reviews.create(restaurant: flavors, rating: 4, text: "Lots of variety. Their specialty is their quinoa bowls with all kinds of mixins.")

peter.reviews.create(restaurant: sophies, rating: 4, text: "A little sketched out by the meat.")
peter.reviews.create(restaurant: flavors, rating: 3, text: "My fallback lunch place.")

jess.reviews.create(restaurant: chipotle, rating: 4, text: "Sometimes you just gotta go to Chipotle.")

simon.reviews.create(restaurant: chipotle, rating: 4, text: "They're super annoying (what's it called?).  Oh, the sneeze guard.  Assholes.")