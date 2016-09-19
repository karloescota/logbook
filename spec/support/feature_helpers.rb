RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.before :suite do
    Warden.test_mode!
  end

  config.after :each do
    Warden.test_reset!
  end
end

def create_logged_in_user(user = nil)
  user ||= create(:user)
  login_as(user, scope: :user)
  user
end
