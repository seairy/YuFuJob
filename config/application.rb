# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module YuFuJob
  class Application < Rails::Application
    config.time_zone = 'Beijing'
    config.i18n.default_locale = :zh
    config.active_record.raise_in_transactional_callbacks = true
  end
end
