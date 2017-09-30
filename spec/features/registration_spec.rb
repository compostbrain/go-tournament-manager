require "rails_helper"

feature "Tournament Director Registration" do
  feature "Form" do
    scenario "can be reached successfully" do
      visit new_user_registration_path
      expect(page.status_code).to eq 200
    end
    xscenario 'can be submitted successfully' do
      visit new_user_registration_path
      fill_in("user_first_name", with: "James")
      fill_in("user_last_name", with: "Bond")
      fill_in("user_email", with: "james@dragonslayer.com")
      fill_in("user_email_confirmation", with: "james@dragonslayer.com")
      click_on("submit")

      expect(page.status_code).to eq 200

    end
  end
end
