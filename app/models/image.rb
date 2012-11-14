class Image < ActiveRecord::Base
  attr_accessible :type, :url
  belongs_to :place
  belongs_to :activity
end
