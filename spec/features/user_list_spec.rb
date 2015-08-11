require 'rails_helper'

RSpec.describe'User Lists' do
  context 'With valid attributes' do

    before(:each) do
      List.create(title: "My list", description: "This is my list" )
      List.create(title: "Second List", description: "This is my second list" )
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

    # it "Can go to a task on a list" do
    #   visit lists_path
    #   click_link "My List"
    #   expect(page).to
    # end 

  end

end

  #   it "deletes a beer" do
  #     visit new_admin_beer_path
  #     fill_in "beer[name]", with: "beer to delete"
  #     page.choose "beer[state]", match: :first
  #     fill_in "beer[description]", with: "STALE"
  #     fill_in "beer[price]", with: 9
  #     page.check "Lager"
  #     click_button "Create Beer"
  #     expect(page).to have_content("beer to delete")
  #     click_link "Beers Index"

  #     click_link "Delete Beer"
  #     expect(page).to_not have_content("beer to delete")
  #     expect(page).to_not have_content("STALE")
  #   end

  #   it "edits a beer" do
  #     visit new_admin_beer_path
  #     fill_in "beer[name]", with: "beer to edit"
  #     page.choose "beer[state]", match: :first
  #     fill_in "beer[description]", with: "YUCK"
  #     fill_in "beer[price]", with: 4
  #     page.check "Lager"
  #     click_button "Create Beer"
  #     expect(page).to have_content("beer to edit")
  #     click_link "Beers Index"

  #     click_link "Edit Beer"
  #     fill_in "beer[name]", with: "new beer"
  #     page.choose "beer[state]", match: :first
  #     fill_in "beer[description]", with: "YUM!"
  #     fill_in "beer[price]", with: 5
  #     page.check "Lager"
  #     click_button 'Update Beer'
  #     expect(page).to_not have_content("beer to edit")
  #     expect(page).to have_content("YUM!")
  #     expect(page).to have_content("new beer")
  #   end

  # end

  # context "with invalid attributes" do
  #   let(:admin) do
  #     User.create(fullname: "Skeeter McTyson",
  #                 password: "pw",
  #                 email: "skeeter@email.com",
  #                 phone: "111-111-1111",
  #                 role: 1)
  #   end

  #   before(:each) do
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  #     Category.create(name: "Lager", description: "wheaty")
  #   end
    
  #   it "won't create a beer with invalid attributes and redirects to admin beers path" do
  #     visit new_admin_beer_path
  #     fill_in "beer[name]", with: "DAS BEER"
  #     page.choose "beer[state]", match: :first
  #     fill_in "beer[description]", with: "High gravity, high flavor"
  #     page.check "Lager"
  #     click_button "Create Beer"
  #     expect(page).to_not have_content("DAS BEER")
  #     expect(page).to_not have_content("High gravity, high flavor")
  #     expect(page).to have_content("Price can't be blank")
  #     expect(current_path).to eq(admin_beers_path)
  #   end

  # end

  # context 'with default user logged in' do
  #   let(:user) do
  #     User.create(fullname: "Bum",
  #                 password: "pw",
  #                 email: "homeless@email.com",
  #                 phone: "111-111-1111",
  #                 role: 0)
  #   end

  #   it "displays a 404 error" do
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #     visit admin_beers_path
  #     expect(page).to have_content("404")
  #   end
  # end