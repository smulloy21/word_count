require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word count process', {:type => :feature}) do
  it('checks how many instances of a given word occur in a given sentence') do
    visit('/')
    fill_in('sentence', :with => "can't hurry love")
    fill_in('word', :with => "love")
    click_button("Send")
    expect(page).to have_content("occurs once")
  end
end