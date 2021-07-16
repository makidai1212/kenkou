source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'carrierwave',             '1.2.2'
gem 'rmagick'
gem 'aws-sdk-s3',              '1.46.0', require: false
gem 'active_storage_validations', '0.8.2'
gem 'bcrypt',     '3.1.13'
gem 'faker',          '2.1.2'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'puma',       '4.3.6'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
gem 'rails-i18n'
gem 'counter_culture', '~> 1.8'
gem 'kaminari'
gem 'jquery-rails'
gem 'font-awesome-sass'
gem 'fog-aws'
gem 'dotenv-rails'

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'launchy'
end

group :production do
  gem 'pg', '1.1.4'
  gem 'fog', '1.42'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails-i18n'