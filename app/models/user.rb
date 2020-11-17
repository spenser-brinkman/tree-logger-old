class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :username, :password
  validates :username, uniqueness: true

  has_many :trees

end