source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '>= 7.0.0'
gem 'sprockets-rails'
gem 'arel'

gem 'active_model_serializers'
gem 'json_schema'

gem 'sshkey'
gem 'mixlib-shellout'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rubocop', require: false
  gem 'bundler-audit'
  gem 'puma'
end

group :development do
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
