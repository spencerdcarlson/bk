class Activity < ActiveRecord::Base
  attr_accessible :name, :user_id, :user_rating
  has_many :interests
  has_many :users, :through => :interests
  has_many :places
  has_many :images
end
