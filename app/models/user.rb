

class User < ActiveRecord::Base
	validates :username, uniqueness: true
	def self.getUsername user_id
		@username = User.find(user_id).username
	end
	has_secure_password
	has_many :tickets
	has_many :comments
end
