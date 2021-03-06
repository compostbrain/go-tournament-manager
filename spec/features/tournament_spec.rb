require "rails_helper"

describe 'navigate' do
  let :tournament_director { create(:tournament_director) }
  let :new_tournament { create(:tournament) }

  before do
    sign_in tournament_director
  end

  describe "#index" do
    it "can be reached successfully" do
      visit tournaments_path
      expect(page.status_code).to eq(200)
    end
    it "has a title of Tournaments" do
      visit tournaments_path
      expect(page).to have_content(/Tournaments/)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      visit new_tournament_path
      expect(page.status_code).to eq 200
    end
    xit 'can be created from new form page' do
      visit new_tournament_path
      fill_in 'tournament[name]', with: "Return of the Jedi"
      fill_in 'tournament[location]', with: "Saturns Rings"
      fill_in 'tournament[begin_date]', with: Date.today
      fill_in 'tournament[end_date]', with: Date.tomorrow
      fill_in 'tournament[number_of_rounds]', with: 4


      click_on "Save"

      expect(page).to have_content("Return of the Jedi")
    end
    it 'will have a tournament director associated with it' do
      visit new_tournament_path
      fill_in 'tournament[name]', with: "Return of the Jedi"
      fill_in 'tournament[location]', with: "Saturns Rings"
      fill_in 'tournament[begin_date]', with: Date.today
      fill_in 'tournament[end_date]', with: Date.tomorrow
      fill_in 'tournament[number_of_rounds]', with: 4

      click_on "Save"

      expect(TournamentDirector.last.tournaments.last.name).to eq("Return of the Jedi")

    end

  end
end
