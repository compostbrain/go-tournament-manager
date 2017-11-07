# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let! :factory_user { create(:user) }

  describe "creation" do
    it 'can be created' do
      expect(factory_user).to be_valid
    end
    it 'cannont be created without a first_name' do
      factory_user.first_name = nil
      expect(factory_user).to_not be_valid
    end
    it 'cannont be created without a last_name' do
      factory_user.last_name = nil
      expect(factory_user).to_not be_valid
    end
    it 'cannont be created without a password' do
      factory_user.password = nil
      expect(factory_user).to_not be_valid
    end
  end
end
