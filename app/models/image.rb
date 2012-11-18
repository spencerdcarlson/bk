class Image < ActiveRecord::Base
  attr_accessible :type, :url, :place_id, :event_id, :user_id, :activity_id, :rating, :image_type, :title, :description
  belongs_to :place
  belongs_to :activity
  belongs_to :user
  belongs_to :event
end
