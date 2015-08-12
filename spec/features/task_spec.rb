require 'rails_helper'

RSpec.describe'User Tasks' do
  let(:list) do
    List.create!(title: "List", description: "list for tasks") 
  end

  context 'With valid attributes' do

      let(:task) { Task.create(title: "Get beer",
                           status: 0,
                           notes: "Want hops in my belly",
                           due_date: Date.tomorrow,
                           start_date: Date.tomorrow,
                           list: list)}

    it "can create a task and displays it after creation" do
      visit list_path(list)
      click_link "New Task"

      fill_in "task[title]", with: "My task"
      fill_in "task[notes]", with: "My task's body"

      fill_in "task[start_date]", with: "11/10/2015"
      fill_in "task[due_date]", with: "12/10/2015"

      click_button 'Create Task'

      expect(page).to have_content("My task")
      expect(page).to have_content("My task's body")
    end

    it "can edit a task" do
      visit task_path(task)
      click_link "Edit Task"

      fill_in "task[title]", with: "Updated task"
      fill_in "task[notes]", with: "Updated body"

      fill_in "task[start_date]", with: "11/10/2015"
      fill_in "task[due_date]", with: "12/10/2015"

      click_button 'Update Task'

      expect(page).to have_content("Updated task")
      expect(page).to have_content("Updated body")
    end

    it "can delete a task" do
      visit task_path(task)
      click_link "Delete Task"

      expect(page).to_not have_content("Get beer")
      expect(page).to_not have_content("Want hops in my belly")
    end

  end

  context "with invalid attributes" do
    
    it "can't create a task with start date in the past" do
      visit list_path(list)
      click_link "New Task"

      fill_in "task[title]", with: "My task 2"
      fill_in "task[notes]", with: "My task's body 2"

      fill_in "task[start_date]", with: "3/10/2015"
      fill_in "task[due_date]", with: "12/10/2015"

      click_button 'Create Task'

      expect(page).to have_content("My task 2")
      expect(page).to have_content("My task's body 2")
    end

    it "can't create a task with due date in the past" do
      visit list_path(list)
      click_link "New Task"

      fill_in "task[title]", with: "My task 2"
      fill_in "task[notes]", with: "My task's body 2"

      fill_in "task[start_date]", with: "12/10/2015"
      fill_in "task[due_date]", with: "3/10/2015"

      click_button 'Create Task'

      expect(page).to have_content("My task 2")
      expect(page).to have_content("My task's body 2")
    end

  end

end
