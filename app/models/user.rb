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
  
  attr_accessible :email, :password, :password_confirmation, :zip_code, :is_admin
  validates_uniqueness_of :email
  validates :email, :presence => true, :email => true
  #validates :password, :length => { :minimum => 8 }
  # each User.new creates calls generate_token and stores it in :auth_token
  before_create { generate_token(:auth_token) }
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  
end
