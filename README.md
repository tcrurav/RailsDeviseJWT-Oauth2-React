# Devise-JWT with OAuth2

A Ruby on Rails API with a CRUD using Devise-JWT to login/register. 

### Before starting

I recommend you to follow the link first 2 tutorials recommended bellow in the links to understand this project.

### Prerequisites

Before starting you need some background on Ruby and Rails. Check the links bellow.

You need a working environment with Ruby on Rails installed and PostgreSQL as well.

In my case I used WSL2 with Ubuntu 20.04. See the links bellow.

It's necessary to install Postgresql. See the links bellow to install it on WSL2.

### Installing

Open a command line console and clone this project.

```
git clone https://github.com/tcrurav/Devise-JWT-Bicycles
```

Go to the new created directory

```
cd Devise-JWT-Bicycles
```

Install all dependencies

```
bundle install
```

Now generate a secret key. And note the output. We’ll add this into our credentials file momentarily.

```
rake secret
```

Generate rails credentials. The commands below will create the config/master.key and config/credentials.yml.enc files:

```
SET EDITOR="C:\Windows\System32\notepad.exe"
rails credentials:edit
```

The notepad will open up. Now paste in the following, with the key generated from running rake secret above.

```
devise:
  jwt_secret_key: <rake secret key>
```

Change the file config/database.yml

```
database: ruby_bicycles_development
username: postgres  
password: <your password>
```

Now make all migrations:

```
rails db:create db:migrate
```

Now the seeds:

```
rails db:seed
```

Boot your API

```
rails s
```

Now it's time to enjoy this project. Test your API with POSTMAN using the following requests:
https://documenter.getpostman.com/view/3446841/UVeNkMk2


The recommended order for the POSTMAN requests will be:

```
GET http://localhost:3000/bicycles
```

You'll get a message saying 'You are not logged in'.

Now register a user and log in:

```
Post http://localhost:3000/users
POST http://localhost:3000/users/sign_in
```

Copy the Bearer Token in the headers returned, and use it in the following request:

```
GET http://localhost:3000/bicycles
```

Now you'll get the info. Congrats!!!

Try the other resquests as well...


## Built With

* [Rails](https://rubyonrails.org/) - Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end
* [devise-jwt](https://rubygems.org/gems/devise-jwt/versions/0.5.6?locale=es) - JWT authentication for devise with configurable token revocation strategies.
* [PostgreSQL](https://www.postgresql.org/) - The World's Most Advanced Open Source Relational Database
* [WSL 2 - Ubuntu 20.04](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10) - Install Ubuntu on WSL2 on Windows.

## Acknowledgments

* https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database. Install Postgresql on WSL2.
* https://www.youtube.com/watch?v=DED9YZWVbO8. Installing rvm and ruby on Windows with Ubuntu bash using WSL2.
* https://dakotaleemartinez.com/tutorials/devise-jwt-api-only-mode-for-authentication/. A Devise-JWT Tutorial For Authenticating Users in Ruby on Rails (USING RAILS 7). I have used this tutorial as a basis for this project.
* https://medium.com/ruby-daily/a-devise-jwt-tutorial-for-authenticating-users-in-ruby-on-rails-ca214898318e. A Devise-JWT Tutorial For Authenticating Users in Ruby on Rails (USING RAILS 6).
* https://dev.to/lisahjung/beginner-s-guide-to-creating-an-api-from-scratch-using-rails-2eie. Beginner's guide to creating an API from scratch (using Rails 6).
* https://guides.rubyonrails.org/v5.0/getting_started.html. Getting Started with Rails.
* https://stackoverflow.com/questions/57402435/how-to-run-rails-credentialsedit-on-windows-10-without-installing-a-linux-sub. How to run 'rails credentials:edit' on Windows 10.
* https://gist.github.com/db0sch/19c321cbc727917bc0e12849a7565af9. Regenerate Rails credentials.