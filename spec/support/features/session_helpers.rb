module Features
  module SessionHelpers
    def sign_up(name, email, password)
      visit new_user_registration_path
      fill_in 'user_name', with: name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(user)
      visit new_user_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"  
    end

    def create_item(item, user)
      visit user_path(user.id)
      fill_in "Description", :with => item.name
      click_button "Save"
    end
end
end