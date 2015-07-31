require "rails_helper"
require "rake"

describe "todo:delete_items task" do
   item_1 =  Item.create(created_at: (DateTime.now.to_date - 9).to_date)
   item_2 = Item.create(created_at: (DateTime.now.to_date - 9).to_date)
  before { system("rake todo:delete_items") }

  it "delete all items from the ToDo list greater than 7 days old" do
    expect(item_1).not_to exist_in_database
    expect(item_2).not_to exist_in_database
  end
end
