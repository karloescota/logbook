require 'rails_helper'

RSpec.feature 'Logs management' do
  let!(:user) { create(:user, name: 'Huwan') }

  before do
    create_logged_in_user
    visit '/logs'
  end

  feature 'navigation' do
    scenario 'viewing user time in, time out' do
      expect(page).to have_current_path('/logs')
      expect(page).to have_content 'Huwan'
      expect(page).to have_content user.email
    end
  end
end
