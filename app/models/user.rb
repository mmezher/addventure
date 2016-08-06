class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50}
	val_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, presence: true, length: {maximum: 60}, format: { with: val_email_regex }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}

#returns hash digest of given string
def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 

	BCrypt::Engine.cost

	BCrypt::Password.create(string, cost:cost)
	end
end