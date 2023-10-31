source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# manage rails and react application start
# gem "foreman"

# Sidekiq
gem "sidekiq", "~> 7.2"
gem 'sidekiq-failures'

# Styles components
gem 'bootstrap', '~> 5.3.2'
# gem 'font-awesome-rails'
# gem 'simple_form'
# gem "jquery-rails"
# gem "sass-rails"

# Authentication and Authorization
gem "devise", "~> 4.8"
# gem 'cancancan'

#Admin panel
# gem 'rails_admin'

#allows cross domain calls
# gem 'rack-cors'

#better handle of DB Views
# gem "scenic"

# CPF and CNPJ
gem 'cpf_cnpj'

# # Sentry monitro fror developers debug
# gem "sentry-ruby"
# gem "sentry-rails"
# gem "sentry-sidekiq"

##i18n translations
gem 'rails-i18n'
gem 'devise-i18n'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'awesome_print'

  #mock data genrator
  gem 'factory_bot_rails'
  gem 'faker'

  #test suite
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers', '~> 5.0'

  #better debug interface
  gem 'pry'
  gem 'pry-rails'

  # Environment variables
  gem 'dotenv-rails'

  # Linters
  gem "rubocop"
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
  gem "ruby-lsp", require: false
  gem "solargraph", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Docker file generator ro Ruby on rails
  gem "dockerfile-rails", ">= 1.5"

  #i18n management
  gem 'i18n-tasks'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  gem 'fuubar'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
