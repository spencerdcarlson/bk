class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_many :interests
  has_many :activities, :through => :interests
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :zip_code
  validates_uniqueness_of :email
  validates :email, :presence => true, :email => true
  #validates :password, :length => { :minimum => 8 }
end
