# url-shortner
Url shortner service app in ruby with sinatra
## Installation

### Ruby Version
- Ruby 2.5.0

### Clone Fluxday
```sh
git clone https://github.com/nidhinnambiar/url-shortner.git  
```

### Install bundler and required gems
Once the specified version of Ruby is installed with all its dependencies satisfied, run the following command from the root directory of the application.
```sh
gem install bundler
bundle install
```
### Configure database
```sh
cp config/database.yml.example config/database.yml
```
Update the credentials in database.yml with actual values.

Now you can create the database and perform migrations
```sh
rake db:create
rake db:migrate
```
Run the app with

```sh
rackup
```
or

```sh
thin start
```

## API details

Open Api end-point added for viewing url hits count and original url
```sh
<host>/api/:code
```
