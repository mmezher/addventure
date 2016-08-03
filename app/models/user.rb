class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50}
	val_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, presence: true, length: {maximum: 60}, format: { with: val_email_regex }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}

	end
