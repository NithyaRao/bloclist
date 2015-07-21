require 'rails_helper'

describe "User Sign In and Sign out " do
   
   describe "Sign into Blocitoff" do
    describe "should allow registered user to sign in" do
      let(:user) { FactoryGirl.create(:user) }
      before do  
          sign_in(user)
     end 
     it "sucessful,redirects to the User Profile page" do     
      expect(current_path).to eq user_path(user.id)      
     end

     it "does the top navigation change to indicate you are signed in?" do 
      expect(current_path).to eq user_path(user.id)
      expect(page).not_to have_content( "Sign In or Sign Up")
      expect(page).to have_content( "Sign out")
     end
   end 
  describe "should not allow unregistered user to sign in" do
    it "should not allow an unregistered user to sign in" do
      visit new_user_session_path
      fill_in "Email", :with => "notarealuser@example.com"
      fill_in "Password", :with => "fakepassword"
      click_button "Sign in"
      expect(page).to have_content("Sign In or Sign Up")
      expect(page).to have_content("Invalid email or password")
    end
  end  
 end

  describe "Sign out of Blocitoff " do
      let(:user) { FactoryGirl.create(:user) }
      before do  
         sign_in(user)
     end 

     it "sign out successful" do
       within '.user-info' do
         click_link 'Sign out'
       end
       expect(current_path).to eq root_path
       expect(page).to have_content( "Sign In or Sign Up")
      expect(page).not_to have_content( "Sign out")

    end
 end

 describe "Attempt to reset password " do
     let!(:user) { FactoryGirl.create(:user) }
      
     describe "reset password through forgot password link" do
      
       before do
        visit new_user_session_path
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
       end
        it "displays forgot your password" do
          reset_mailer
         click_link "Forgot your password?"
         fill_in "Email", :with => user.email
         expect {
            click_button "Send me reset password instructions"
            }.to change{ActionMailer::Base.deliveries.size}.by(1)
        end
      end  
 end
end
