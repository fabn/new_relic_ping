require 'spec_helper'

RSpec.describe HeartbeatRails::Configuration do

  # Clear out any previous settings
  before { HeartbeatRails.config_instance = nil }

  describe 'Initialization' do

    it 'should produce a valid configuration without needing configuration' do
      expect(HeartbeatRails.config).to be_a HeartbeatRails::Configuration
    end

    it 'should accepts attributes' do
      custom_config = HeartbeatRails::Configuration.new(foo: 'bar')
      expect(custom_config.foo).to eq 'bar'
    end

    it 'should accept nested attributes' do
      custom_config = HeartbeatRails::Configuration.new(foo: {bar: 'baz'})
      expect(custom_config.foo).to eq(bar: 'baz')
    end

  end

  describe 'Monitors' do

    let(:result) { HeartbeatRails.config.status_check }
    let(:state) { result.first }
    let(:results) { result.last }

    describe 'Working monitors' do

      before do
        HeartbeatRails.configure do |c|
          # Database monitor is installed by default
          c.monitor('maths') { 2 + 2 }
        end
      end

      it 'should work' do
        expect(state).to be :ok
      end

      describe 'Database monitor' do

        it 'should return database response' do
          expect(results['database_response']).to eq 'true'
        end

        it 'should return database timing' do
          expect(results['database_time']).to match %r{[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? seconds}
        end

      end

      describe 'Custom monitor' do

        it 'should return its value' do
          expect(results['maths_response']).to eq '4'
        end

      end

    end

    describe 'Failing monitor' do

      before do
        HeartbeatRails.configure do |c|
          c.monitor('flaky-service') { raise 'service not available' }
        end
      end

      it 'should fail' do
        expect(state).to be :error
      end

      it 'should return exeception message in state' do
        expect(results['error_message']).to eq 'service not available'
      end

    end

  end

end