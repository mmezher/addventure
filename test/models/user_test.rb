require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Example User", email: "user@example.com". password: "foobar", password_confirmation: "foobar")
  end
  test "should be valid" do
  	assert @user.valid? 
  end
  test "name should be present" do
  	@user.name = " "
  	assert_not @user.valid?
  end
  test "password should be present (not blank)" do
  	@user.password = @user.password_confirmation = " "*6
  		assert_not @user.valid?
  	end
  test "password should have at least 6 chars" do
  	@user.password = @user.password_confirmation = "a"*5
  		assert_not user.valid?
  	end
  test "authenticated? should return false for nil digest" do 
    assert_not @user.authenticated?(:remember, '')
  end
  	
end
