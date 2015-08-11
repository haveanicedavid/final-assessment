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

end
