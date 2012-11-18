class Place < ActiveRecord::Base
  attr_accessible :activity_id, :directions, :hours, :location, :zip_code
  has_many :comments
  has_many :images
  has_many :events
  belongs_to :activity
end
