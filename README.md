# Flickr Feed

## Quick Take

This simple Rails app utilizes the Flickr API to show a photo feed for any Flickr account. For more information on the project requirements, check out [The Odin Project.](https://www.theodinproject.com/lessons/ruby-on-rails-flickr-api)

## How it Works

Users enter a Flickr user ID into the form and the resulting photo feed will be displayed. This project was refactored to allow for usernames to be entered too.

The Ruby gem [flickr](https://github.com/cyclotron3k/flickr) (formerly known as FlickRaw) was used to simply access to the Flickr API with some easy method mapping. 

The Ruby gem [Figaro](https://github.com/laserlemon/figaro) was also added to simplify the use of environment variables for accessing the Flickr API Id, key and shared secret while preventing them from being committed and publicly displayed.

I designed this app to use public photos without requiring authentication. Originally I utilized the `flickr.people.getPublicPhotos` method from the API which allows a `user_id` field to take the NSID of a Flickr user. But this method doesn't allow an actual Flickr username to be used without the NSID. I updated the form to account for either option, but then decided to use the `flick.photos.search` method instead, which can take a user ID or username.

The flickr gem has some slick URL helpers built in so instead of having to construct the Flickr url with ids, secrets and server ids, you can use the photo id and specify any size suffixes. Here I stuck with large image sizes.

## Try It Local

* Ruby version 3.0.3
* Rails version 7.0.2.4

```ruby
git clone git@github.com:dm-murphy/flickr-feed.git
bundle install
```

## What Was Learned

The Flickr API docs offered a lot of methods, but once I started mixing in the Ruby gems it wasn't always easy figuring out the shortcuts here on the method calls. But simplifying the photo URLs with the flickr gem makes things much cleaner. It was surprising to see that some of Flickr's methods would work with only the user ID (NSID) while others allowed for the username too. This wasn't always clear in the docs but was uncovered through trial and error.

This project helepd me see through the process of setting up an app to work with a third-party API and some of the issues involved, but once those are sorted out it becomes pretty fun to play around with the available methods and utilize an external app's abilities on your own site.