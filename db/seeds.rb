# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

flatiron = Community.create(name: "Flatiron School", latitude: 40.705397, longitude: -74.013924)

sophies = flatiron.restaurants.create(name: "Sophie's", category: "Cuban", yelp_url: "http://www.yelp.com/biz/sophies-cuban-cuisine-new-york-8", address: "73 New St")
chipotle = flatiron.restaurants.create(name: "Chipotle", category: "Mexican", yelp_url: "http://www.yelp.com/biz/chipotle-mexican-grill-new-york-30", address: "2 Broadway")
flavors = flatiron.restaurants.create(name: "Flavors", category: "Salad/Sandwiches", yelp_url: "http://www.yelp.com/biz/flavors-new-york", address: "27 Whitehall St")

brandon = flatiron.members.create(name: "Brandon Hopkins")
peter = flatiron.members.create(name: "Peter Glennons")
jess = flatiron.members.create(name: "Jess Rudder")
simon = flatiron.members.create(name: "Simon Seroussi")

