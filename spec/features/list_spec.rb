require 'rails_helper'

RSpec.describe'User Lists' do
  context 'With valid attributes' do

    before(:each) do
      List.create(title: "My list", description: "This is my list" )
      # List.create(title: "Second List", description: "This is my second list" )
    end

    it 'displays the lists' do
      visit lists_path
      expect(page).to have_content("My list")
      expect(page).to have_content("This is my list")
    end

    it "creates a new list" do
      visit new_list_path
      fill_in "list[title]", with: "list title"
      fill_in "list[description]", with: "Testing creation of list"

      click_button "Create List"
      expect(page).to have_content("list title")
      expect(page).to have_content("Testing creation of list")
    end

    it "deletes a list" do
      visit lists_path
      click_link "Delete List"
      expect(page).to_not have_content("My list")
      expect(page).to_not have_content("This is my list")
    end

    it "updates a list" do
      visit lists_path
      click_link "Edit List"

      fill_in "list[title]", with: "Updated title!"
      fill_in "list[description]", with: "Updated Description!"
      click_button "Update List"

      expect(page).to_not have_content("My list")
      expect(page).to_not have_content("This is my list")

      expect(page).to have_content("Updated title!")
      expect(page).to have_content("Updated Description!")
    end

  end

end
