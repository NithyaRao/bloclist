require 'rails_helper'

describe "User To-Do list", type: :feature, js: true do
    let(:user) { create(:user) }
    let!(:item) { create(:item, user: user) }
    let!(:item_collection) { build_list(:item, 3, user: user) }
    before { sign_in(user) }
    
  describe "If item exists" do
    it "displays item" do
        wait 1 do 
          expect( current_path ).to eq user_path( user.id )
        end
       # save_and_open_page
        expect(page).to have_content(item.name)

    end
  end   

  describe "if item does not exist" do    
    it "creates the item adds to the to-do list" do
       wait 1 do
         expect( current_path ).to eq user_path( user.id )
       end 
      # print page.html
      # byebug
       create_items( item_collection[0].name)
       wait 1 do
         # because 1 item already exists by  let!(:item) { create(:item, user: user) } so expect 2 items.
         expect( user.items.count).to eq(2)
       end
    end 

   it "can you create multiple to-do items " do
      wait 1 do
        expect( current_path ).to eq user_path( user.id ) 
      end
      3.times { |i| create_items( item_collection[i].name) }     
      wait 1 do
        expect(user.items.count).to eq(3) 
       end 
   end
   it "Are the to-do items displayed after creation? " do
        3.times { |i| create_items( item_collection[i].name)
        wait 1 do 
           expect(page).to have_content(item_collection[i].name)
        end    
         }         
   end
 end
end
