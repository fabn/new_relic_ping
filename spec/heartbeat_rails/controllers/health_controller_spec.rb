RSpec.describe HeartbeatRails::HealthController, type: :controller do

  routes { HeartbeatRails::Engine.routes }
  before { HeartbeatRails.config_instance = nil }

  context 'with successful checks' do

    describe 'GET ping' do
      before { get :ping }
      it 'has a 200 status code' do
        expect(response.status).to eq(200)
        expect(response.body).to eq 'ok'
      end
    end

    describe 'GET health' do
      before { get :health }
      it 'should respond with success' do
        expect(response.status).to eq(200)
      end

      it 'should add status headers' do
        expect(response.headers).to have_key 'X-Database-Response'
        expect(response.headers['X-Database-Response']).to eq 'true'
        expect(response.headers).to have_key 'X-Database-Time'
        expect(response.headers['X-Database-Time']).to match %r{[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? seconds}
      end
    end

  end

  context 'with failing checks' do

    before do
      HeartbeatRails.configure do |c|
        c.monitor('flaky') { raise 'this is your friendly failure message' }
      end
    end

    describe 'GET health' do
      before { get :health }
      it 'should respond with error' do
        expect(response.status).to eq(500)
      end

      it 'should add status headers' do
        expect(response.headers).to have_key 'X-Error-Message'
        expect(response.headers['X-Error-Message']).to eq 'this is your friendly failure message'
      end
    end

  end

end