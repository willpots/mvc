require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get validate" do
    get :validate
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
