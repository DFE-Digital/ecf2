source "https://rubygems.org"

ruby "3.3.4"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "pg", "~> 1.5"
gem "propshaft"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[windows jruby]

gem "govuk-components"
gem "govuk_design_system_formbuilder"

gem "mail-notify"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec"
  gem "rspec-rails"
  gem "rubocop-govuk"
end

group :test do
  gem "capybara"
end
