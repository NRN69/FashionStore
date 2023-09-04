# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_storage_validations'
gem 'ancestry'
gem 'avo'
gem 'bootsnap', require: false
gem 'breadcrumbs_on_rails'
gem 'chartkick'
gem 'country_select'
gem 'cssbundling-rails'
gem 'devise'
gem 'draper'
gem 'foreman', github: 'ddollar/foreman'
gem 'inline_svg'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'kaminari'
gem 'meta-tags', require: 'meta_tags'
gem 'oj'
gem 'oj_mimic_json'
gem 'pg', '~> 1.1'
gem 'propshaft'
gem 'puma', '~> 6.3'
gem 'pundit'
gem 'rails', '~> 7.0.4'
gem 'rails-i18n', '~> 7.0.6'
gem 'ransack'
gem 'simple_form'
gem 'stimulus-rails'
gem 'turbo-rails', '~> 1.0.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem  'byebug'
  gem  'database_cleaner'
  gem  'debug', platforms: %i[mri mingw x64_mingw]

  gem  'factory_bot'
  gem  'faker'
  gem  'pry'

  gem 'rails-controller-testing'
  gem 'rspec-json_expectations'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-i18n'
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
  gem 'solargraph-rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'db-query-matchers'
  gem 'json_spec'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

# Use Redis for Action Cable
gem 'redis', '~> 5.0.6'

gem 'noticed', '~> 1.6'
