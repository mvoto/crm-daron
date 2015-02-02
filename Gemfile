source 'https://rubygems.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.17.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Sass-powered version of Bootstrap.
gem 'bootstrap-sass', '~> 3.1.1'
# Cause devs are not designers. Read more: https://github.com/seyhunak/twitter-bootstrap-rails
gem 'twitter-bootstrap-rails', '~> 3.2.0'
# Pagination. Read more: https://github.com/bootstrap-ruby/will_paginate-bootstrap
gem 'will_paginate-bootstrap', '~> 1.0.1'
# For jquery date picker. Read more: https://github.com/joliss/jquery-ui-rails
gem 'jquery-ui-rails', '~> 5.0.2'
# Forms made easy. Read more: https://github.com/plataformatec/simple_form
gem 'simple_form', '~> 3.0.2'
# Filters FTW. Read more: https://github.com/activerecord-hackery/ransack
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
# Slugging and permalink plugins for ActiveRecord. Read more: https://github.com/norman/friendly_id
gem 'friendly_id', '~> 5.0.0'
# For Settings.yml. Read more: https://github.com/railsconfig/rails_config
# gem 'rails_config', '~> 0.4.2'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 3.4.1'

group :development do
  gem 'spring', '~> 1.1.3'        # Speeds up application. Read more: https://github.com/rails/spring
  # gem 'capistrano', '2.15.5'
  # gem 'capistrano-ext'
  # gem 'capistrano-multistage'
  gem 'awesome_print', '~> 1.2.0' # https://github.com/michaeldv/awesome_print
  gem 'annotate', '~> 2.6.5'      # https://github.com/ctran/annotate_models
end

group :development, :test do
  gem 'therubyracer', '~> 0.12.1'        # https://github.com/cowboyd/therubyracer
  # gem 'delorean'                       # for time travel in specs
  gem 'pry', '~> 0.10.1'                 # Pry = win
  gem 'pry-byebug', '~> 2.0.0'           # Adds step, next and etc to pry
  gem 'fuubar', '~> 2.0.0'               # pretty rspec output
  gem 'rspec-rails', '~> 3.1.0'          # http://rspec.info
  gem 'capybara', '~> 2.4.3'             # https://github.com/jnicklas/capybara
  gem 'capybara-webkit', '~> 1.3.0'      # https://github.com/thoughtbot/capybara-webkit
  gem 'shoulda-matchers', require: false # https://github.com/thoughtbot/shoulda
  gem 'launchy', '~> 2.4.2'              # https://github.com/copiousfreetime/launchy
end

group :development, :test, :staging do
  gem 'factory_girl_rails', '~> 4.5.0' # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
  gem 'faker', '~> 1.4.3'              # http://faker.rubyforge.org/
  gem 'database_cleaner', '~> 1.3.0'   # https://github.com/DatabaseCleaner/database_cleaner
  gem 'rspec-its', '~> 1.0.1'          # https://github.com/rspec/rspec-its
end

group :production do
  # gem 'unicorn', '~> 4.8.3'        # use unicorn as the app server
  gem 'rails_12factor', '~> 0.0.3' # https://github.com/heroku/rails_12factor
end
