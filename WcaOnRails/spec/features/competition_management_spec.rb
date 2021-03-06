require "rails_helper"

RSpec.feature "Competition management" do
  context "when signed in as admin" do
    let(:admin) { FactoryGirl.create :admin }
    before :each do
      sign_in admin
    end

    scenario "User creates a new competition" do
      visit "/competitions/new"
      fill_in "Name", with: "My Competition 2015"
      click_button "create-competition"

      expect(page).to have_text("Successfully created new competition!")
    end

    scenario "User confirms a competition" do
      competition = FactoryGirl.create(:competition, :with_delegate)
      visit edit_competition_path(competition)
      click_button "Confirm"

      expect(page).to have_text("Successfully confirmed competition.")
    end
  end
end
