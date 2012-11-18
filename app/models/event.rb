class Event < ActiveRecord::Base
  attr_accessible :date, :description, :place_id, :recurring, :time, :title
  has_many :comments
  has_many :images
  belongs_to :place
end
