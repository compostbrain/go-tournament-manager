require 'rails_helper'

RSpec.describe Round, type: :model do
  let! :new_round { create(:round) }

  it { is_expected.to belong_to(:tournament) }

  describe  "creation" do
    it 'cannot be created without a number' do
      new_round.number = nil

      expect(new_round).to_not be_valid

    end
  end
end
