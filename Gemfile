source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', :git => 'https://github.com/rails/rails.git'
gem 'sprockets-rails', :git => 'https://github.com/rails/sprockets-rails.git'
gem 'arel', :git => 'https://github.com/rails/arel.git'

gem 'active_model_serializers', '~> 0.10.0.rc1'
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
