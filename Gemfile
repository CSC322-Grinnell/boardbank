source 'https://rubygems.org/'

gem 'rails', '4.2.5.1'

gem 'activeadmin', '~> 1.0.0.pre2'
gem 'devise'
gem 'protected_attributes'
group :development, :test do
  gem 'sqlite3'
end

gem 'rubocop', '~> 0.37.2', require: false

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
  gem 'rspec-rails', '2.14'
  gem 'simplecov'
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'database_cleaner' # required by Cucumber
  gem 'autotest-rails'
  gem 'factory_girl_rails' # if using FactoryGirl
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
gem 'carmen-rails'
