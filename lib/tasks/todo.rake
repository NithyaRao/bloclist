namespace :todo do
  desc "to-dos should be automatically deleted seven days after their creation date"
  task delete_items: :environment do
       Item.delete_expired_items
     end

end


