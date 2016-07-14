require 'test_helper'

class GenerateControllerTest < ActionController::TestCase
  test "should get controller" do
    get :controller
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get cretae" do
    get :cretae
    assert_response :success
  end

end
