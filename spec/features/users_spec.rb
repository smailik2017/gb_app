require 'rails_helper'

describe 'edit user profile', type: :feature do
  let(:user) { create(:user) }
  
  before do
    login_as user
    visit edit_profiles_path
  end

  context 'fields are filled in correctly' do
    it 'edit profile info' do
      find('#user_info').set('111')
      find_button('Save').click
      expect(User.last.info.to_s.include?('111')).to be_truthy
    end
  end
end
