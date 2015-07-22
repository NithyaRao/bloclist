require 'rails_helper'
describe "User Profile" do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }         

  describe "should allow registered user to sign in" do
         
     it "successful,redirects to your user profile page" do
       visit user_path(user)
       expect(current_path).to eq(user_path(user))
       expect( page ).to have_content(user.name)
     end
  end

  describe "user profile page" do
    before { visit user_path(user) } 
    it "displays appropriate user details" do
       expect(page).to have_content("#{user.name}'s Profile") 
      expect(page).to have_link('Sign out', href: destroy_user_session_path )
    end 
  end
end