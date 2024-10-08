require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module Ecf2
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.assets.paths << Rails.root.join('node_modules/govuk-frontend/dist/govuk/assets')
    config.exceptions_app = routes
    config.active_record.belongs_to_required_by_default = false
    config.generators.system_tests = nil

    config.generators do |g|
      g.helper(false)
      g.factory_bot(suffix: "factory")
      g.test_framework(:rspec,
                       fixtures: false,
                       view_specs: false,
                       controller_specs: false,
                       helper_specs: false)
    end
  end
end
