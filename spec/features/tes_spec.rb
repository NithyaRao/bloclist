require 'rails_helper'

describe "User To-Do list", type: :feature, js: true do
    let(:user) { create(:user) }
    let!(:item) { create(:item, user: user) }
     let(:item_collection) { build_list(:item, 3, user: user) }
      before { sign_in(user) }
    
   it "Are the to-do items displayed after creation? " do
   #  3.times { |i|  create_items( item_collection[i].name) 
   #      expect(page).to have_content(item_collection[1].name) 
   #    }
      create_items( item_collection[0].name)
      wait 1 do
         expect( user.items.count).to eq(2)      
      end
   end
end
