require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should have a essential attributes present' do
      expect(build(:user, email: nil)).not_to be_valid
      expect(build(:user, name: nil)).not_to be_valid
    end
  end
end
