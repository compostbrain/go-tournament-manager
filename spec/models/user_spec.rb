require 'rails_helper'

RSpec.describe User, type: :model do
  let! :factory_user { create(:user) }

  describe "creation" do
    it 'can be created' do
      expect(factory_user).to be_valid
    end
    it 'cannont be created without a first_name and last_name' do
      factory_user.first_name = nil
      factory_user.last_name = nil
      expect(factory_user).to_not be_valid
    end

  end
end
