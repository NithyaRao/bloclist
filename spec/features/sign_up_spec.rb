require 'rails_helper'
describe "user_signup" do 
  describe "Sign up a new user" do
    let(:user) { FactoryGirl.build(:new_user) }

    it "Sign a new user up" do
      sign_up(user.name, user.email, user.password)
    end

    it "Do you receive a confirmation email?" do
      sign_up(user.name, user.email, user.password)
      expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
      expect(unread_emails_for(user.email).count).to eq(1)
      open_email(user.email)
      expect(current_email).to have_body_text('You can confirm your account email through the link below')
      click_email_link_matching(/#{user_confirmation_path}/)
      expect(page).to have_content('Sign in')
      sign_in(user)
      expect(page).to have_content('Sign out')
    end
    
  end
  describe "if you attempt to sign up with an invalid email?" do
    let(:user) { FactoryGirl.build(:new_user) }
    it "gives an error if you sign up with an invaild email" do
      user.email = "fakeemail"
      sign_up(user.name, user.email, user.password)
      expect(page).to have_content("Email is invalid")
      expect(page).to have_content('Sign Up')
    end 
  end
  describe "if you attempt to sign up with a duplicate email?" do
     let(:user) { FactoryGirl.create(:user) }
     let(:new_user) { FactoryGirl.build(:new_user) }
     it "gives an error if you sign up with a duplicate email" do
       sign_up(new_user.name, user.email, new_user.password)
       expect(page).to have_content("Email has already been taken")
       expect(page).to have_content('Sign Up')
     end  
  end
end