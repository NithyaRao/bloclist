namespace :todo do
  desc "to-dos should be automatically deleted seven days after their creation date"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
