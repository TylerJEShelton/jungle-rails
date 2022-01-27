class User < ActiveRecord::Base

  has_secure_password

  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true

end
