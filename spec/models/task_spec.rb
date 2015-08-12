require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { Task.create(title: "Get beer",
                           status: 0,
                           notes: "Want hops in my belly",
                           due_date: Date.tomorrow,
                           start_date: Date.tomorrow)}

  context "is valid" do

    it "is valid with valid attributes" do
      expect(task).to be_valid
    end

  end

  context "is not valid" do

    it "isn't valid without a title" do
      task.title = ""
      expect(task).to_not be_valid
    end
    
    it "due date can't be in the past" do
      task.due_date = Date.yesterday
      expect(task).to_not be_valid
    end

    it "start date can't be in the past" do
      task.start_date = Date.yesterday
      expect(task).to_not be_valid
    end
  end

end