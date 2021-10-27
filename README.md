Order is a Store and User purchase database.  This is part of a project that 

  - Created a new Rails API application
  - Configured cookies and sessions
  - Added a React frontend
  - Configured your application for deployment
  - Tested your application locally and in production
  - Set up three GitHub repository   store-api,store-front, and store-remote


![Getting Started](./Bakery.png)
Wire frame
https://excalidraw.com/#json=5681204200210432,tE8KGQL-9xSIT-DzI0vPqg

MVP
https://docs.google.com/document/d/111vFXhQJRSIoFi9UzvUDZzW4rReBZendnTuPeM8XvCk/edit
# README

bundle install

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version
  2.74

- System dependencies

- Configuration

- Datagresql

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
  https://dbdiagram.io/d/6174b5bb6239e146477f6004



Terminal
rails new store_api --api database=postgresql --minimal --skip-javascript -T
bundle install

Uncomment
Gemfile --> gem cors 
config/cors.rb line 8 and below change origins 'example.com' to origins '\*'

Terminal
git checkout -b branch (automatically created repo w/ rails)


npm uninstall -g create-react-app         ***remove old versions
****root directory *****  npx create-react-app client --use-npm


Tests
Terminal 1      rails s
Terminal 2      npm start --prefix client
Do they start on diferent servers?

*extension GitLens - see commits, branches, different repos
*View -->Open then drag and drop the views to the side bar




https://docs.github.com/en/github/importing-your-projects-to-github/importing-source-code-to-github/adding-an-existing-project-to-github-using-the-command-line


Created User Controller/Model/DB Migration  
rails generate resource User username password email first_name last_name phone_number address unit state zipcode:integer
rails generate resource Store name motto product price:integer 
rails generate resource Order user:belongs_to store:belongs_to total:integer review_title review_stars:integer review:text

To Do -check sql model below








Confirmation
rails generate resource Confirmation user:belongs_to store:belongs_to..... product_rating:integer detailed_review:text
rails generate resource
Test Rails c

Add Associations (has_many, dependent:destroy
Add Validations e.g. no blank password/email minimum with password email must have @

rails db:migrate db:seed

Check Routes
Terminal
rails s   
UI/Browser/Postman

orders - get/show/post/patch/delete  with invalid routes
stores-
users-

add validations


*If Postman -->Header--> Replace Key Value with Content-Type application/json
*If Postman Create or Patch change to raw (round button) and JSON (a dropdown on the far right of the same line)

*Only if server is already running on http://localhost:3000/
Terminal 
lsof -i :3000   
        =>   copy PID *the active process identifier
        COMMAND   PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
        ruby    58127 jaenwawe   12u  IPv4 0x8d1be0faee1dede9      0t0  TCP localhost:hbci (LISTEN)
        =>  kill PID
 kill -9 58127  => No resonse is a good thing.  Retry rails s to test routes

Get Heroku Account
Heroku CLI. For OSX, use Homebrew:

brew tap heroku/brew && brew install heroku

To use the Heroku CLI's autocomplete --
  Via homebrew's shell completion:
    1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
        NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
              and called, either explicitly or via a framework like oh-my-zsh.
    2) Then run
      $ heroku autocomplete --refresh-cache
  OR
  Use our standalone setup:
    1) Run and follow the install steps:
      $ heroku autocomplete

zsh completions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/heroku/7.59.1: 28,792 files, 63.0MB, built in 45 seconds
==> Caveats
==> heroku
To use the Heroku CLI's autocomplete --
  Via homebrew's shell completion:
    1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
        NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
              and called, either explicitly or via a framework like oh-my-zsh.
    2) Then run
      $ heroku autocomplete --refresh-cache
  OR
  Use our standalone setup:
    1) Run and follow the install steps:
      $ heroku autocomplete

zsh completions have been installed to:
  /usr/local/share/zsh/site-functions


PostGres
 brew install postgresql

This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgres
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html

For OSX, use Homebrew to start postgresql:

  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres


To start postgresql:

  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres

        optional
                (
                brew postgresql-upgrade-database
            This formula has created a default database cluster with:
                initdb --locale=C -E UTF-8 /usr/local/var/postgres
            For more details, read:
                https://www.postgresql.org/docs/14/app-initdb.html

                )


Push existing repo from terminal?

git remote add origin git@github.com:jaenwawe/store-api.git
git branch -M main
git push -u origin main

Serializer?
convert from json to Native


Questions



*Decide which rails generator
https://medium.com/@matt.readout/rails-generators-model-vs-resource-vs-scaffold-19d6e24168ee

**Setup a Rails/React Web App
https://github.com/learn-co-curriculum/react-rails-project-setup-guide#react-setup

***Switch from sqlite3 to PostgreSQL
https://medium.com/@virtual_khan/converting-rails-from-sqlite3-to-postgresql-d97023314a14