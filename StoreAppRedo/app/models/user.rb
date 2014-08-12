class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	validates_presence_of :email
	validates :email, uniqueness: true

	#def authenticate(email, password)
	#end

	has_one :card
	has_one :store
end
