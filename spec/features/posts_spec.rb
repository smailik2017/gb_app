require 'rails_helper'

describe 'new post page', type: :feature do
  let(:user) { create(:user) }
  
  before do
    login_as user
    visit new_post_path
  end

  context 'fields are filled in correctly' do
    it 'creates new post' do
      find('#post_title').set('Test Post')
      find_button('Create Post').click
      expect(Post.last.title).to eq('Test Post')
    end
  end
end
