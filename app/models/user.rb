class User < ActiveRecord::Base
	attr_accessor :remember_token, :activation_token, :reset_token
	before_save :downcase_email
	before_create :create_activation_digest
	validates :name, presence: true, length: { maximum: 50}
	val_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, presence: true, length: {maximum: 60}, format: { with: val_email_regex }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
#returns hash digest of given string
def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 

	BCrypt::Engine.cost

	BCrypt::Password.create(string, cost:cost)
end
#Returns random tokens
def User.new_token
	SecureRandom.urlsafe_base64
end

#Remembers user in database for use in cookie storage
def remember
	self.remember_token = User.new_token
	update_attribute(:remember_digest, User.digest(remember_token))
end

#returns true if given token matches digest
def authenticated?(attribute, token)
	digest = send("#{attribute}_digest")
	return false if digest.nil?
	BCrypt::Password.new(digest).is_password?(token)
end 

def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
end

def send_activation_email
    UserMailer.account_activation(self).deliver_now
end

#sets password reset attributes
def create_reset_digest
	self.reset_token = User.new_token
	update_attribute(:reset_digest, User.digest(reset_token))
	update_attribute(:reset_sent_at, Time.zone.now)
end


def send_password_reset_email
	UserMailer.password_reset(self).deliver_now
end  

def password_reset_expired?
	reset_sent_at < 2.hours.ago
end 

def forget
	update_attribute(:remember_digest, nil)
end

private

def downcase_email
	self.email = email.downcase
end

def create_activation_digest
	self.activation_token = User.new_token
	self.activation_digest = User.digest(activation_token)
end
end

