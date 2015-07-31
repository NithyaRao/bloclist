every 1.day, :at => '12:00 am' do
  RAILS_ENV="development" rake "todo:delete_items" 
end