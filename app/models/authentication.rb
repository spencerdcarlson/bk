class Authentication < ActiveRecord::Base
  attr_accessible :image_url, :provider, :sent_at, :uid
  belongs_to :user
  validates :provider, uniqueness: { scope: :uid }
end
