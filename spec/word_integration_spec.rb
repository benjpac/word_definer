require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word#', {:type => :feature}) do
  it('adds word, clicks on word, adds definition, adds image') do
    visit('/')
    fill_in('word', :with => 'abcdefg')
    click_button('Add Word')
    expect(page).to have_content('abcdefg')
    click_link('abcdefg')
    expect(page).to have_content('abcdefg')
    fill_in('definition', :with => 'zyx')
    click_button('Add Definition')
    expect(page).to have_content('abcdefg')
    fill_in('image', :with => 'https://www.sciencenews.org/sites/default/files/main/blogposts/wt_giraffeneck_free.jpg')
    click_button('Add Image')
    expect(page).to have_xpath("//img[contains(@src,'wt_giraffeneck_free.jpg')]")
  end
end
