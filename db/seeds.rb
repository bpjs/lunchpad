# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

flatiron = Community.create(name: "Flatiron School", latitude: 40.705397, longitude: -74.013924)

sophies = flatiron.restaurants.create(name: "Sophie's", category: "Cuban", yelp_url: "http://www.yelp.com/biz/sophies-cuban-cuisine-new-york-8", address: "73 New St")
chipotle = flatiron.restaurants.create(name: "Chipotle", category: "Mexican", yelp_url: "http://www.yelp.com/biz/chipotle-mexican-grill-new-york-30", address: "2 Broadway")
flavors = flatiron.restaurants.create(name: "Flavors", category: "Salad/Sandwiches", yelp_url: "http://www.yelp.com/biz/flavors-new-york", address: "27 Whitehall St")

brandon = flatiron.members.create(name: "Brandon Hopkins", email: "bh@foo.com", password: "password1234", password_confirmation: "password1234")
peter = flatiron.members.create(name: "Peter Glennon", email: "pg@foo.com", password: "password1234", password_confirmation: "password1234")
jess = flatiron.members.create(name: "Jess Rudder", email: "jr@foo.com", password: "password1234", password_confirmation: "password1234")
simon = flatiron.members.create(name: "Simon Seroussi", email: "ss@foo.com", password: "password1234", password_confirmation: "password1234")

brandon.reviews.create(restaurant: sophies, rating: 5.0, text: "I would give it a 5.")
brandon.reviews.create(restaurant: chipotle, rating: 3.5, text: "I like it alright.")
brandon.reviews.create(restaurant: flavors, rating: 4.0, text: "I like Flavors.  They have quinoa.")

peter.reviews.create(restaurant: sophies, rating: 4.2, text: "A little sketched out by the meat.")
peter.reviews.create(restaurant: flavors, rating: 3.8, text: "My fallback lunch place.")

jess.reviews.create(restaurant: chipotle, rating: 4.0, text: "Sometimes you just gotta go to Chipotle.")

simon.reviews.create(restaurant: chipotle, rating: 4.0, text: "They're super annoying (what's it called?).  Oh, the sneeze guard.  Assholes.")
