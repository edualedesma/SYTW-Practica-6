require 'coveralls'
Coveralls.wear!
ENV['RACK_ENV'] = 'test'
require_relative '../chat.rb'
require 'rack/test'
require 'rubygems'
require 'rspec'


include Rack::Test::Methods
def app
  Sinatra::Application
end
describe "Rspec" do

    it "/update" do
		get '/update'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "/send" do
		get '/send'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "/" do
		get '/'
		expect(last_response).to be_ok
	end

 end
