# README
*[GitHub repo](https://github.com/mattreid1/rails-chat-app)*

## Setup
Run  `bundle install` to download everything.

Then run `rake db:setup` to setup the database.

Then run `rails s` to start the web server and websocket server on port 3000.

## Usage

Please go to [`http://localhost:3000/`](http://localhost:3000/) to see the site.

## Account Logins

|Email  |Password|
|-------|-----------|
|test0@test.com|test|
|test1@test.com|test|
|test2@test.com|test|
|test3@test.com|test|
|test4@test.com|test|

These accounts are set up in the `rake db:setup` command as they are in `db/seeds.rb`.

(Yes, the password is `test` for all the accounts for simplicity)