require 'rails_helper'

describe "User Mark ToDo list complete" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:item_collection) { create_list(:item, 3, user: user) }
    before { sign_in(user) }

   it "can you delete multiple to-do items " do
       expect( current_path ).to eq user_path( user.id ) 
      # expect { 3.times { |i|  create_items( item_collection[i].name) }}.to change {user.items.count}.by (3)  
       print page.html
       expect { item_collection.each { |item|  delete_items( item.user_id, item.id) }}.to change {user.items.count}.by (0)   
   end
  
end