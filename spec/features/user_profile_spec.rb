require 'rails_helper'
describe "User Profile", js:true do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }         

  describe "should allow registered user to sign in" do
         
     it "successful,redirects to your user profile page" do
       visit user_path(user)
       wait 1 do 
       expect(current_path).to eq(user_path(user))
       end
       expect( page ).to have_content(user.name)
     end
  end

  describe "user profile page" do
    it "displays appropriate user details" do
      # save_and_open_page
       expect(page).to have_content("#{user.name}'s Profile") 
       wait 1 do
      expect(page).to have_link('Sign out', href: destroy_user_session_path )
      end
    end 
  end
end