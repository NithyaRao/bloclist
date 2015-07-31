require 'rails_helper'

RSpec.describe Item, type: :model do
   let(:user) { create(:user) }
   let!(:item) { create(:item, user: user, created_at: (DateTime.now).to_date) }
   let!(:item_old) { create(:item, user: user, created_at: (DateTime.now - 2).to_date ) }
    let!(:item_collection) { create_list(:item, 3, user: user, created_at: (DateTime.now - 9).to_date ) }
    
   describe "#days_left" do
     it "returns the number of days left within 7 days for To-Do items" do
         expect(item.days_left).to eq(7)
         expect(item_old.days_left).to eq(5)
     end 
   end 

   describe "#delete_expired_items" do
          
       it "delete all items from the ToDo list greater than 7 days old" do
          expect(user.items.count).to eq(5)
          expect(Item.delete_expired_items.count).to eq(3)
          expect(user.items.count).to eq(2)
       end
   end 
end
