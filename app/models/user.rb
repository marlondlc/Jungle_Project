class User < ActiveRecord::Base

  #relationships:?
  #has_many:
  #belongs_to:

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true


  has_secure_password

  validates_uniqueness_of :email

end
