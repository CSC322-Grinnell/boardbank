require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  #Bundler.require(*Rails.groups(:assets => %w(development test)))
  #Bundler.require(:default, :assets, Rails.env)
  Bundler.require(*Rails.groups)

  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Boardbank
  class Application < Rails::Application
    # Disallow callbacks to return false. In Rails 5.0> they need to use throw(:abort)
    ActiveSupport.halt_callback_chains_on_return_false = false

    config.active_record.raise_in_transactional_callbacks = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    #config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    #config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # To prevent precompilation with Rails 3.X
    config.assets.initialize_on_precompile = false

    # Added to fix devise/active admin issue ?
    config.assets.initialize_on_precompile = false

    # Precompile additional assets. Defaults to [application.js, application.css, non-JS/CSS]
    config.assets.precompile += ['active_admin.css.scss', 'active_admin.js']

    # Rails 5 now supports per-form CSRF tokens to mitigate against code-injection
    # attacks with forms created by JavaScript. With this option turned on, forms
    # in your application will each have their own CSRF token that is specified
    # to the action and method for that form.
    config.action_controller.per_form_csrf_tokens = true

    # Configure site to check HTTP origin header against sites origin header for additional security
    config.action_controller.forgery_protection_origin_check = true
  end
end
