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

describe 'make API call to load path', :type => :feature do 
 
  it "should load the chat page" do
    visit 'http://localhost:4567/chat'
    #expect(page).to have_content("welcome")
  end

  it "should load the home page" do
    visit 'http://localhost:4567'
    expect(page).to have_content("Regístrate")
  end



end
 
