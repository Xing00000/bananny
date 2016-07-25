class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :nanny
  has_one :parent
  has_one :profile


  def registered?
  	self.parent || self.nanny
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

end
