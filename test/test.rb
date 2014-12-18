require 'capybara' # loading capybara
require 'capybara/dsl'
require 'rack/test'
require 'coveralls'

Coveralls.wear!

Capybara.default_driver = :selenium 

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random
end


urlHer = 'https://michatajax.herokuapp.com'

describe 'make API call to load path', :type => :feature do 
  puts "hola"
  it "should load the home page" do
    puts "dentro"
    visit "#{urlHer}"
    expect(page).to have_content("Regístrate")
  end
end

describe 'make API call to load chat and to found elements' do
  it "should load the chat page" do
    visit "#{urlHer}/chat"
    expect(page).to have_content("Bienvenido")
  end
end

describe 'make API sign in whith a specific name' do
  it 'user login' do
    visit "#{urlHer}"
    fill_in 'usuario', :with => 'Sergio'
    click_on('Regístrate')
    visit "#{urlHer}/chat"
    expect(page).to have_content("Sergio")     
  end
end

describe 'chat page' do
   it 'have a chat with the chat' do
      visit "#{urlHer}/chat"
      fill_in 'text', :with => 'Ey'
      #click_on('')
      #expect(page).to have_content('')
   end
end
   