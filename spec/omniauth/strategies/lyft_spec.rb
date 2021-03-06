require 'spec_helper'

describe OmniAuth::Strategies::Lyft do
  subject do
    @subject ||= begin
      @options ||= {}
      args = ['client_id', 'client_secret', @options].compact
      OmniAuth::Strategies::Lyft.new(*args)
    end
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('lyft')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.lyft.com/v1')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://api.lyft.com/oauth/authorize?response_type=code')
    end

    it 'should have correct access token url' do
      expect(subject.options.client_options.token_url).to eq('https://api.lyft.com/oauth/token')
    end

    it 'should indicate that the provider ignores the state parameted' do
      expect(subject.options.provider_ignores_state).to eq false
    end
  end
end
