require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { List.create(title: "My list",
                           description: "This is my list" )}

  context "is valid" do

    it "is valid with valid attributes" do
      expect(list).to be_valid
    end

  end

  context "is not valid" do

    it "isn't valid without a title" do
      bad_task = List.create(description: "fail")
      expect(bad_task).to_not be_valid
    end
    
  end

  context "has tasks" do
    
    it "has tasks" do
      list.tasks.create(title: "Get beer",
                         status: 0,
                         notes: "Want hops in my belly",
                         due_date: "11/10/2100",
                         start_date: "11/10/2100")
      expect(list.tasks.length).to equal(1)
    end
  end
end
