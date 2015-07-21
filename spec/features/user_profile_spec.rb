require 'rails_helper'
describe "User Profile" do

  describe "should allow registered user to sign in" do
      let(:user) { FactoryGirl.create(:user) }

      before do  
          sign_in(user)
     end      
 
     it "successful,redirects to your user profile page" do
       visit user_path(user)
       expect(current_path).to eq(user_path(user))
       expect( page ).to have_content(user.name)
     end
  end

  describe "user profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
      visit user_path(user)
    end  
    it "displays appropriate user details" do
       expect(page).to have_content("#{user.name}'s Profile") 
      expect(page).to have_link('Sign out', href: destroy_user_session_path )
     end 
  end
end