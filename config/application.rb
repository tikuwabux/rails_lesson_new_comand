require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # blocked host エラー解消のため追加したコード3
    #config.middleware.delete ActionDispatch::HostAuthorization
    # => rails s 再起動時､エラーが発生したためボツ
    # =>文頭をonfigからcocfigに変更したらできた! ボツ取り消し｡
    
    # CRUD処理/Create で追加
    config.action_controller.permit_all_parameters = true
    config.time_zone = 'Tokyo'
    
    # I18n 国際化で追加
    #config.i18n.default_locate = :ja =>スペルミスでサーバー立ち上げ時に
    config.i18n.default_locale = :ja
  end
end
