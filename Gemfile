source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.1.6'
gem 'pg', '~> 0.17.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.3'
gem 'turbolinks', '~> 2.4.0'
gem 'jquery-turbolinks', '~> 2.1.0'
gem 'jbuilder', '~> 2.0'
# gem 'sass-rails', '~> 4.0.3'
# gem 'bootstrap-sass', '~> 3.1.1'
gem 'twitter-bootstrap-rails', '~> 3.2.0'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'jquery-ui-rails', '~> 5.0.2'
gem 'simple_form', '~> 3.0.2'
# gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'ransack'
gem 'friendly_id', '~> 5.0.0'
gem 'devise', '~> 3.4.1'
gem 'factory_girl_rails', '~> 4.5.0'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
gem 'less-rails'
gem 'less-rails-bootstrap'
gem 'therubyracer', '~> 0.12.1'        # https://github.com/cowboyd/therubyracer
gem 'carrierwave', '~> 1.0'
gem 'fog-aws', '~> 1.3.0'
gem 'mini_magick', '~> 4.8.0'

group :development do
  gem 'spring', '~> 1.1.3'          # Speeds up application. Read more: https://github.com/rails/spring
  gem 'awesome_print', '~> 1.2.0'   # https://github.com/michaeldv/awesome_print
  gem 'annotate', '~> 2.6.5'        # https://github.com/ctran/annotate_models
  gem 'mailcatcher'
end

group :development, :test do
  gem 'pry', '~> 0.10.1'                 # Pry = win
  gem 'pry-byebug', '~> 2.0.0'           # Adds step, next and etc to pry
  gem 'fuubar', '~> 2.0.0'               # pretty rspec output
  gem 'rspec-rails', '~> 3.1.0'          # http://rspec.info
  gem 'capybara', '~> 2.4.3'             # https://github.com/jnicklas/capybara
  gem 'capybara-webkit', '~> 1.3.0'      # https://github.com/thoughtbot/capybara-webkit
  gem 'shoulda-matchers', require: false # https://github.com/thoughtbot/shoulda
  gem 'launchy', '~> 2.4.2'              # https://github.com/copiousfreetime/launchy
  gem 'dotenv-rails', '~> 2.2.1'         # https://github.com/bkeepers/dotenv
end

group :development, :test, :staging do
  gem 'faker', '~> 1.4.3'              # http://faker.rubyforge.org/
  gem 'database_cleaner', '~> 1.3.0'   # https://github.com/DatabaseCleaner/database_cleaner
  gem 'rspec-its', '~> 1.0.1'          # https://github.com/rspec/rspec-its
end

group :production do
  gem 'unicorn', '~> 4.8.3'        # use unicorn as the app server
  gem 'rails_12factor', '~> 0.0.3' # https://github.com/heroku/rails_12factor
end
