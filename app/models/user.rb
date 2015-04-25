class User < ActiveRecord::Base
  require 'twitter'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications, :dependent => :destroy

  def apply_omniauth(omniauth)
    self.name = omniauth['info']['name']
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token => omniauth['credentials']['token'], :image => omniauth['info']['image'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end
