require 'sinatra' 
require 'sinatra/reloader' if development?

require 'uri'
#set :port, 3000
#set :environment, :production


chat = ['welcome..']

usuarios = []

get '/' do
  erb :register
end

post '/chat' do

  # Capturar el nombre del usuario
  puts "Dentro de los parametros: #{params}"
  usuarios.push(URI::parse(params[:usuario]).to_s)
  puts "Estos son los usuarios registrados: #{usuarios}"
  puts "Los usuarios ahora mismo son"
  puts usuarios
  erb :index
end

get '/login' do
  erb :login
end

get '/send' do
  return [404, {}, "Not an ajax request"] unless request.xhr?
  chat << "#{request.ip} : #{params['text']}"
  nil
end

get '/pedirusuarios' do
   enviar = "<ul id='lista-usuarios'>"
   usuarios.each do | user |
     enviar = enviar + "<li>" + user.to_s + "</li>"
   end
   enviar = enviar + "</ul>"
   enviar.to_s
end
get '/update' do
  return [404, {}, "Not an ajax request"] unless request.xhr?
  @updates = chat[params['last'].to_i..-1] || []

  @last = chat.size
  erb <<-'HTML', :layout => false
      <% @updates.each do |phrase| %>
        <%= phrase %> <br />
      <% end %>
      <span data-last="<%= @last %>"></span>
  HTML



end

