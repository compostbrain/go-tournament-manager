require "rails_helper"

describe 'navigate' do
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
    it 'can be created from new form page' do
      visit new_tournament_path
      fill_in 'tournament[name]', with: "Return of the Jedi"
      fill_in 'tournament[location]', with: "Saturns Rings"
      fill_in 'tournament[director]', with: "Humpty Dumpty"
      fill_in 'tournament[begin_date]', with: Date.today
      fill_in 'tournament[end_date]', with: Date.tomorrow

      click_on "Save"

      expect(page).to have_content("Return of the Jedi")
    end

  end
end
