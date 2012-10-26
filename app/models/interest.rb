class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  attr_accessible :activity_id, :user_rating
  validates :activity_id, uniqueness: { scope: :user_id }
end
