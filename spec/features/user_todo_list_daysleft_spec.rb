require 'rails_helper'

describe "User To-Do list Days left", type: :feature, js: true do
    let(:user) { create(:user) }
    let!(:item) { create(:item, user: user) }
    let!(:item_old) { create(:item, user: user, created_at: (DateTime.now - 2).to_date ) }

    before { sign_in(user) }
    it "Are the to-do items dyas left displayed? " do
        wait 1 do 
           expect(item.days_left).to eq(7)
           expect(page).to have_content(item.days_left)
           expect(item_old.days_left).to eq(5)
           expect(page).to have_content(item_old.days_left)
        end             
    end
end   