class User < ActiveRecord::Base
  before_create :generate_api_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  private
  def generate_api_token
    self.api_token = SecureRandom.urlsafe_base64
    generate_api_token if User.exists?(api_token: self.api_token)
  end
end
