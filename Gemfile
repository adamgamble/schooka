source 'http://rubygems.org'


gem 'rails', '3.1.0.rc1'
gem 'haml-rails'
gem 'sqlite3'
gem "rake", "0.8.7"

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3', :platforms => :ruby
  gem 'pg'
end

group :development, :test do
  # Pretty printed test output
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'turn', :require => false
  gem "erb2haml"
end
