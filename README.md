# Local Lunch

## Description

If you trust the opinions of random internet denizens, get your lunch recommendations from Yelp.  If you want the inside info that comes from trusted members of your community, use Local Lunch!

Local Lunch provides lunch recommendations from your "community" (whether it's your paper sales office or your bird watching club).  Everyone knows that Sophie's is great, but only members of your community know whether or not you'll be able to get in and out before your office's lunch hour is over.

Once you've decided where to eat, you can use the "Lunch Groups" feature to let people know where you're gong (and when) so that they can join in on the festivities.


## Screenshots

Add some spiffy screenshots of your app here.

## Background

We like lunch!  And we like good lunch recommendations.  Most of all we like going to lunch with the people around us.

Lunch Pad makes all of that easier.


## Usage

When you sign in, you'll see the restaurant information for your community.

You can browse through the reviews, add a review of your own, or even add a hidden gem that no one else in your office has discovered yet!

If you've made a decision about where you're going to eat, you can head to the Lunch Groups page to let other people know.  Make a group for Yip's at 12:30 or Subway at 1:22.  Other members of your community can see these groups and add themselves to the VIP guest list.  You'll never have to lunch alone again!

## Authors

- Peter Glennon - github: https://github.com/pcrglennon,   twitter: @pcrglennon
- Brandon Leuci -  https://github.com/bajh,   twitter: @bhkns
- Jessica Rudder -  github: https://github.com/jessrudder,   twitter: @JessRudder
- Simon Seroussi - github: https://github.com/simonseroussi, twitter: @simonseroussi

## A Note on Forking

We use [figaro](https://github.com/laserlemon/figaro) to keep our Yelp API stuff out of source control.  When forking/cloning, follow these steps:
 - run `bundle`, as usual
 - comment out all code in config/initializers/yelp.rb
 - run `rails g figaro:install`
 - in the config/application.yml file created by figaro, insert your Yelp API credentials in this format:

   ```ruby
   YELP_CONSUMER_KEY: your_consumer_key
   YELP_CONSUMER_SECRET: your_consumer_secret
   YELP_TOKEN: your_token
   YELP_TOKEN_SECRET: your_token_secret
   ```

- un-comment the code in config/initializers/yelp.rb

## License

Local Lunch is MIT Licensed. See LICENSE for details.
