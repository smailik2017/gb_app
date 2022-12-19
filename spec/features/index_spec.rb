require 'rails_helper'

describe 'the main page', type: :feature do
  
  let(:user) { create(:user) }
  
  before do
    login_as user
    visit '/'
  end

  
  it 'shows a link to news' do
    expect(page).to have_text('News')
  end

  it 'redirects to Posts after clicking on News' do
    click_link('News')
  
    expect(current_path).to eq posts_path
  end

end
