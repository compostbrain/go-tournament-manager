require 'rails_helper'

RSpec.describe User, type: :model do
  let! :factory_tournament { create(:tournament) }

  describe "creation" do
    it 'can be created' do
      expect(factory_tournament).to be_valid
    end
    it 'cannont be created without a name' do
      factory_tournament.name = nil

      expect(factory_tournament).to_not be_valid
    end
    it 'cannont be created without a location' do
      factory_tournament.location = nil

      expect(factory_tournament).to_not be_valid
    end
    # it 'cannont be created without a director' do
    #   factory_tournament.director = nil
    #
    #   expect(factory_tournament).to_not be_valid
    # end
    it 'cannont be created without a begin_date' do
      factory_tournament.begin_date = nil

      expect(factory_tournament).to_not be_valid
    end
    it 'cannont be created without a end_date' do
      factory_tournament.end_date = nil

      expect(factory_tournament).to_not be_valid
    end

  end
end
