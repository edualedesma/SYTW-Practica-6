require 'sinatra' 
require 'sinatra/reloader' if development?

require 'uri'
#set :port, 3000
#set :environment, :production


chat = ['welcome..']

usuarios = []

enable :sessions
set :session_secret, '*&(^#234a)'

get '/' do
  if (!session[:user]) #Comprobamos si el usuario ya se registro o no.
    erb :signup
  else
    erb :index
  end
  
end

get '/chat' do
  erb :index
end

post '/chat' do
  # Capturar el nombre del usuario
  #puts "Dentro de los parametros: #{params}"
  user = URI::parse(params[:usuario]).to_s
  if (usuarios.include?(user))
    redirect '/'
  else
    usuarios.push(user)
    session[:user] = user
    puts "Este es el usuario de la sesion: #{session[:user]} y de la variable: #{user}"
  #puts "Estos son los usuarios registrados: #{usuarios}"
  puts "Los usuarios ahora mismo son"
  puts usuarios
    erb :index
  end
end

get '/logout' do
  usuarios.delete(session[:user])
  session.clear
  redirect '/'
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

