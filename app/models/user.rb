class User < ActiveRecord::Base

  has_secure_password

  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

end
