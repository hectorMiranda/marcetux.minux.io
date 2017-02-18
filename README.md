# Welcome to Minux.IO

Thank you for checking out Minux.IO. This project will allow you to follow the tutorials and suggest changes or new features.

A live version of this application can be access at www.marcetux.com
# Getting Started

##Clone this repository

```
git clone https://github.com/hectorMiranda/minux.io.git
```

## Set up RVM and create a gemset 

Follow this instructions to set up your initial development environment.

1. Install RVM
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
```
2. Install 2.3.1 as the default
```
rvm install 2.3.1
```
3. Create minux gemset and use this 2.3.1 as default
```
rvm use 2.3.1@minux --create
```
4. Install bundler
```
gem install bundler
```
5. Run bundle install
```
bundle install
```

## Create database

Make sure your current user has the right permissions, if you get an error due to permissions run as a super user:
```
ALTER USER your_user_name CREATEDB
```
And then run:
```
rails db:create
```
7. Run migrations
```
rails db:migrate
```
8. Start project
```
rails s
```
