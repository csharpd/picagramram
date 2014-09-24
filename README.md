== Picagram

An instagram clone

![](app/assets/images/screenshot.png)

To view the live app, visit: http://picagram.herokuapp.com/

###Objectives

Get a deeper understanding of Rails and using paperclip to upload pictures onto Amazon S3.
Learn about many-to-many associations for posts and tags.
Use the Geolocations capabilities of GMaps to search and display the location of the post.

###Specification

+ Users can post images and tag them
+ Users can add a location which will then be displayed on a map

###Technologies used

+ Rails
+ Ruby
+ RSPEC
+ Heroku
+ CSS
+ HTML
+ Bootstrap
+ Devise
+ Google Maps API
+ Factory Girl
+ Warden
+ Capybara
+ Amazon Web Services

###Set up

```sh
git clone https://github.com/csharpd/picagramram.git
cd picagram
bundle install
```

###Run

```sh
cd picagrams
rails s
```
Open the browser at localhost:3000 to view the app

###How to test it

```sh
cd picagram
rspec
```

### Possible Enhancements
+ General styling & format pictures
+ Pushr (Websockets)
+ Allow users to buy the photos (Stripe)
