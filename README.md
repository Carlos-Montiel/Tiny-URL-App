# Url shortener app

Small Ruby on Rails application to short urls and keep track of the ips on each visit.

It consists of 2 tables: shorten url and statatistics url. When users click on the short URL they are redirected to the long URL and tracks the IP address of each visit.

Details and dependences:

* Ruby version 3.0.0
* Rails version 6.1.4
* PostgreSQL for database
* Rspec as testing framework using [rspec-rails gem](https://github.com/rspec/rspec-rails)

## Installing
After cloning the repository just run in console:
```bash
bundle install
rails db:setup
```
With this, you have installed needed dependences, and prepared the database, Now it's ready to use!

## Using
You can create the short url filling the info in the root path of the app, it generates a short url which you can copy and share with the people you want, each time someone visits the shorten url its created a record to keep track of the visitors ip.

## Testing
To run tests just type:
```bash
rspec -fd
```
It covers models test (relations, validations, callbacks), and some other request type test. 

## Demo app
You can access to a demo of the app in the following [link](https://urlsh1.herokuapp.com).