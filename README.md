what is it?
===========
A sinatra app using the twitter api to display a lo-fi histogram of a user's tweet activity grouped by hour (last 200 tweets only in server-local time)

requirements
============
    gem install sinatra twitter

running the server
==================
    ruby twitter.rb

URLs
====
    GET /twitter/:username
