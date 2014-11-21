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


	it "/send" do
		get '/send'
		expect(last_response.body).to eq("Not an ajax request")
	end


    it "/update" do
		get '/update'
		expect(last_response.body).to eq("Not an ajax request")
	end

	it "/" do
		get '/'
		expect(last_response).to be_ok
	end

	it "/" do
		get '/'
		last_response.body['Login']
	end	

    it "/send" do
       get '/send', {}, 'rack.session' => { :name => 'Testing' }
       expect(last_response.body).to eq("Not an ajax request")
    end
    
    it "Update" do
       get'/update'
       expect(last_response.body).to eq("Not an ajax request")
    end
    
	it "/PedirUsuarios" do
	    get '/pedirusuarios'
	    expect(last_response).to be_ok
	end

    it "HTTP_X_REQUESTED_WITH Update" do
		get '/update',{}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
		expect(last_response).to be_ok
	end
	

	

end

