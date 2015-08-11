require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { Task.create(title: "Get beer",
                           status: 0,
                           notes: "Want hops in my belly",
                           due_date: DateTime.new(9,1,1),
                           start_date: Time.now )}

  # let(:task2) { Task.create(title: "Pass projects",
  #                          status: 0,
  #                          notes: "Want hops in my belly",
  #                          due_date: DateTime.new(9,1,1),
  #                          start_date: Time.now )}

  context "is valid" do

    it "is valid with valid attributes" do
      expect(task).to be_valid
    end

  end

  context "is not valid" do

    it "isn't valid without a title" do
      bad_task = Task.create(notes: "fail")
      expect(bad_task).to_not be_valid
    end
    
  end

end