source 'http://rubygems.org'

gem 'rails', '3.0.0.beta2'
gem 'annotate-models'
gem 'gravtastic'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
	gem 'pg'
end
group :development, :test do
	gem 'sqlite3-ruby', :require => 'sqlite3'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Bundle the extra gems:
# gem 'bj'
gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
group :test do
  gem 'factory_girl', :git => "git://github.com/thoughtbot/factory_girl.git", :branch => "rails3"
	gem 'shoulda', :git => "git://github.com/thoughtbot/shoulda.git", :branch => "rails3"
	gem "rspec-rails", ">= 2.0.0.beta.5"
	gem "rspec", ">= 2.0.0.beta.5"	
	gem 'steak', :git => "git://github.com/cavalle/steak.git", :branch => "rails3"
	gem 'mocha'
	gem 'rack-test'
	gem 'capybara'
	gem 'autotest-rails'
	gem "fakeweb",      "1.2.6"
  gem "redgreen",     "1.2.2"
	gem 'turn'
end
