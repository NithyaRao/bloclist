require 'rails_helper'

describe "User Mark ToDo list complete"do
    let(:user) { create(:user) }
   # let!(:item_collection) { create_list(:item, 3, user: user) }
    let!(:item1) { create(:item, user: user)}
    let!(:item_collection) { create_list(:item, 3, user: user) }
   
    before { sign_in(user) }

    describe "with js", js:true do
       it "can you delete multiple to-do items " do
         wait 1 do
           expect( current_path ).to eq user_path( User.last) 
         end  
         3.times { |i|  delete_items(item_collection[i].id) }
         #  require 'pry'; binding.pry
         #  save_and_open_page
         wait 1 do 
           expect(user.items.count).to eq(1) 
         end   
      end   
   end
 
   describe "with Ajax", js: true do
     it "can ToDo items be deleted with AjAX" do
       lambda do
          xhr :delete, :destroy, :id => item1.id
          response.should be_success 
          should change(Item, :count).by(-1)
       end
     end
   end 
end