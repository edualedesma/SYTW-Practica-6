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
		post '/chat', params = {:usuario => 'Sergio'}
        expect(last_response).to be_ok
	end

	it "/ coincidendia de nombre 1" do
		get '/'
		last_response.body['Tu Chat']
	end	

	it '/ coincidencia de nombre 2' do
		get '/'
		last_response.body['Eduardo']
	end

	it '/ coincidencia de nombre 3' do
		get '/'
		last_response.body['Sergio']
	end
    
    it '/' do
		post '/'
		last_response.body['Sergio']
	end

    it "sesión" do
       get '/', {}, 'rack.session' => { :usuario => 'Eduardo' }
       expect(last_response).to be_ok
    end


	it '/ coincidencia de nombre 3' do
		get '/'
		last_response.body['y']
	end

	it '/chat coincidencia de nombre 3' do
		get '/'
		last_response.body['Usuarios conectados']
	end

	it 'post' do
		post '/', params = {:usuario => 'Sergio'}
		get '/chat'
		last_response.body['Diseñado']
	end

	it '/chat' do
		get '/chat'
		last_response.body['Bienvenido']
	end

    it "/send" do
       get '/send'
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


    it "HTTP_X_REQUESTED_WITH de Update" do
		get '/update',{}, {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
		expect(last_response).to be_ok
	end
	


end

