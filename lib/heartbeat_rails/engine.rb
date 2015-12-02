require 'rails'

module HeartbeatRails
  class Engine < ::Rails::Engine
    isolate_namespace HeartbeatRails

    initializer 'heartbeat_rails.add_routes' do
      if HeartbeatRails.config.automount?
        Rails.logger.debug do
          "Mounting HeartbeatRails::Engine at #{HeartbeatRails.config.mountpoint} with mode #{HeartbeatRails.config.route_method}"
        end
        Rails.application.routes.public_send(HeartbeatRails.config.route_method) do
          mount HeartbeatRails::Engine => HeartbeatRails.config.mountpoint
        end
      end
    end
  end
end
