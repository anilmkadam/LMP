require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module LMS
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.secret_key_base = '04c8cdee23f692d08e9877cce29eb05ed8353ce31d9d39a680ae9a6f0f3bc05f3ca62679685307467afce56b5bdebb2aba63ef42be806f7b9ed605a72c0b4fe9'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.exceptions_app = self.routes
    config.assets.initialize_on_precompile = false
  end
end
