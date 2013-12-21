class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :current_sign_in_ip, :latitude  => :latitude, :longitude => :longitude

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  								:time_zone, :latitude, :longitude

  has_one :user_subscription

  after_validation :geocode
end
