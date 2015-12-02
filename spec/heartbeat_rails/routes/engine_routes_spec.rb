RSpec.describe HeartbeatRails::Configuration, type: :routing do
  routes { HeartbeatRails::Engine.routes }

  it 'routes to the ping endpoint' do
    expect(get: '/').to route_to(controller: 'heartbeat_rails/health', action: 'ping')
  end

  it 'routes to the health endpoint' do
    expect(get: '/health').to route_to(controller: 'heartbeat_rails/health', action: 'health')
  end
end