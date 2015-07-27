require 'rails_helper'

RSpec.describe Item, type: :model do
   let(:user) { create(:user) }
   let!(:item) { create(:item, user: user) }
   let!(:item_old) { create(:item, user: user, created_at: (DateTime.now - 2).to_date ) }
    
   describe "#days_left" do
     it "returns the number of days left within 7 days for To-Do items" do
         expect(item.days_left).to eq(7)
         expect(item_old.days_left).to eq(5)
     end 
   end 
end
