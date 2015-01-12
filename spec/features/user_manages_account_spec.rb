require 'spec_helper'

feature "User manages account" do
  context "Update" do
    scenario "User can update phone number" do
      user = FactoryGirl.create(:user)
      visit user_path(user)
      click_link "Edit My Account"
      expect(page).to have_content("Edit Account")
    end
  end
end
