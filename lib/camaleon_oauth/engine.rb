require 'doorkeeper'
require 'responders'
require 'swagger/docs'
require 'active_model_serializers'
module CamaleonOauth
  class Engine < ::Rails::Engine
    initializer :append_migrations do |app|
      engine_dir = File.expand_path("../../../", __FILE__)
      # migrations checking
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
