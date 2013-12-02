class User < ActiveRecord::Base
  geocoded_by :current_sign_in_ip, :latitude  => :latitude, :longitude => :longitude


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  								:time_zone, :latitude, :longitude

  has_one :user_subscriptions

  after_validation :geocode
end
