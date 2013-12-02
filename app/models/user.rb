class User < ActiveRecord::Base
  geocoded_by :ip, :latitude  => :lat, :longitude => :lng


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  								:time_zone, :ip, :latitude, :longitude

  has_one :user_subscriptions

  before_save :update_ip_address

  after_validation :geocode

  def update_ip_address
  	binding.pry
  	puts request.ip	# =>	"50.131.233.137"
		puts request.location.city	# =>	""
		puts request.location.country
  end
end
