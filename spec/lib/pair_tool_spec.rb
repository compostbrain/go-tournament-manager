require 'rails_helper'

describe "pairing tool" do
  let :player1 { create(:player, rating: 2) }
  let :player2 { create(:player, rating: 6) }
  let :player3 { create(:player, rating: -5) }
  let :player4 { create(:player, rating: 4) }

  before do
    sign_in tournament_director
  end
  xit "removes players receiving byes" do

  end

  xit "sorts the field" do

  end

  xit "creates score groups" do

  end

  xit " pairs each score group"
end
