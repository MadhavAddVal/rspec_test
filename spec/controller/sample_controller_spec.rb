require 'rspec'
require 'json'
require_relative '../../controller/sample_controller'

RSpec.describe SampleController do
  let(:service) { instance_double("Service") }
  let(:controller) { SampleController.new(service) }

  describe '#show' do
    context 'when the service performs the action successfully' do
      let(:data) { { foo: 'bar' } }
      let(:result) { instance_double('Result', success?: true, data: data) }

      before do
        allow(service).to receive(:perform_action).and_return(result)
      end

      it 'returns a successful response with status 200' do
        response = controller.show
        puts response
        expect(response[:status]).to eq(200)
        expect(response[:body]).to eq(data.to_json)
      end
    end

    context 'when the service encounters an error' do
      let(:error_message) { 'An error occurred' }
      let(:result) { instance_double('Result', success?: false, error: error_message) }

      before do
        allow(service).to receive(:perform_action).and_return(result)
      end

      it 'returns an error response with status 400' do
        response = controller.show
        expect(response[:status]).to eq(400)
        expect(response[:body]).to eq({ error: error_message }.to_json)
      end
    end
  end
end
