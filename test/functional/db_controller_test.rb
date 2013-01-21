require 'test_helper'

class DbControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get group" do
    get :group
    assert_response :success
  end

  test "should get person" do
    get :person
    assert_response :success
  end

end
