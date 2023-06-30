source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '>= 6.1.7.4'
gem 'sprockets-rails', '>= 3.2.1'
gem 'arel'

gem 'active_model_serializers', '>= 0.10.12'
gem 'json_schema'

gem 'sshkey'
gem 'mixlib-shellout'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rubocop', '>= 0.49.0', require: false
  gem 'bundler-audit'
  gem 'puma'
end

group :development do
  gem 'spring', '>= 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
