class Comment < ActiveRecord::Base
  attr_accessible :place_id, :text, :user_id, :event_id
  belongs_to :user
  belongs_to :place
  belongs_to :event
end
