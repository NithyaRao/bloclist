require 'rails_helper'

describe "User To-Do list" do
    let(:user) { FactoryGirl.create(:user) }
  #  let(:item) { FactoryGirl.create_list(:item, 3) }
    let!(:item) { FactoryGirl.create(:item) }
    before { sign_in(user)
    }
  describe "If item exists" do
    it "displays item" do
      expect( current_path ).to eq user_path( user.id )
      expect(response).to render_template("/items/_form.html.erb")
       # expect(find('ul.list')).to have_content(item.name)
      expect( page).to have_content( item.name )
     # assert page.has_css?('.list', text: item.name)
    end
  end   
  describe "if item does not exist" do
    let(:new_item) { FactoryGirl.build(:item) }
    it "creates the item adds to the to-do list" do
       create_item( new_item , user )
    end 
  end
   it "can you create multiple to-do items " do
       
       
   end
   it "Are the to-do items displayed after creation? " do
   end
end
