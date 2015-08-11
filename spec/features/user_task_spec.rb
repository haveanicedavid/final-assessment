require 'rails_helper'

RSpec.describe'User Tasks' do
  context 'With valid attributes' do

    # before(:each) do
    #   List.create(title: "List", description: "list for tasks")
    #   Task.create(title: "Finish this project", notes: "I need to finsih before tomorrow morning" )
    #   Task.create(title: "Another task", description: "This is my second task" )
    # end

    it "can create a task" do
      visit new_task_path
      # save_and_open_page
      fill_in "task[title]", with: "My task"
      fill_in "task[notes]", with: "My task's body"

      fill_in "task[start_date]", with: "11/10/2015"
      fill_in "task[due_date]", with: "12/10/2015"

      click_button 'Create Task'

      expect(page).to have_content("My task")
      expect(page).to have_content("My task's body")
    end

    # it 'displays the task' do
    #   visit lists_path
    #   expect(page).to have_content("My list")
    #   expect(page).to have_content("This is my list")
    # end

    # it "creates a new list" do
    #   visit new_list_path
    #   fill_in "list[title]", with: "list title"
    #   fill_in "list[description]", with: "Testing creation of list"

    #   click_button "Create List"
    #   expect(page).to have_content("list title")
    #   expect(page).to have_content("Testing creation of list")
    # end

  end

end
