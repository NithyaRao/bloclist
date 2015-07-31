class Item < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  default_scope { order('created_at DESC')}

   def days_left
      7 - (DateTime.now.to_date - created_at.to_date).to_i
   end

   def self.delete_expired_items
     where("created_at <= ?", Time.now - 7.days).destroy_all
   end
end
