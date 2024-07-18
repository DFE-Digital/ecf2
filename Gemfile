source "https://rubygems.org"

ruby "3.3.4"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

gem "govuk-components"
gem "govuk_design_system_formbuilder"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "rubocop-govuk"
end

group :test do
  gem "capybara"
end

group :test, :development do
  gem "rspec"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end
