# Glacier Web Framework

Glacier is the practical implementation of the proposed universal web framework that can decouple the programming language from the framework, it is currently in pre-alpha development.

TODOs

* For ruby integrate Rack

* Setup assets/public path

* Integrate server configurations to run the webserver for the specific language

* Integrate some form of database for CRUD operations

* Integrate form element for passing data between pages

* Deploy to live server, Ruby: https://devcenter.heroku.com/articles/static-sites-ruby

## To run the server

* run `ruby index.rb`

### Immediate todos

* Refactor code to pull in server code depending on programming language

* Find out how to load items from the base directory

* After the application is created, have the other methods reference the language, maybe create an application.yml file that stores the info and can be referenced