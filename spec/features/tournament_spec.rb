require "rails_helper"

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
