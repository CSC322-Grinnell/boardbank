source 'https://rubygems.org/'

gem 'rails', '5.2.1'

gem 'activeadmin'
gem 'devise'
gem 'bootsnap', require: false
group :development, :test do
  gem 'sqlite3'
end

gem 'rubocop', require: false

gem 'travis-lint'

group :production do
  gem 'pg'
end

#Elastic Search
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

#Searchkick
gem 'searchkick'

# debugger is useful in development mode too
group :development, :test do
  gem 'pry-byebug'
  gem 'jasmine-rails' # if you plan to use JavaScript/CoffeeScript
end
# setup Cucumber, RSpec, autotest support
group :test do
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'database_cleaner' # required by Cucumber
  gem 'autotest-rails'
  gem 'factory_bot_rails' # if using FactoryBot
  gem 'metric_fu'        # collect code metrics
end

#assets
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'toastr-rails'
gem 'font-awesome-rails'

gem 'autoprefixer-rails'
gem 'test-unit'

# for the list of U.S. States
gem 'carmen-rails', :git => 'https://github.com/Studiosity/carmen-rails.git'

# for Heroku deployment
gem 'rails_12factor'

#paginating
gem 'kaminari'
