require 'test_helper'

class DiscountedSalesControllerTest < ActionController::TestCase
  setup do
    @discounted_sale = discounted_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discounted_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discounted_sale" do
    assert_difference('DiscountedSale.count') do
      post :create, discounted_sale: { discount_percent: @discounted_sale.discount_percent, end_date: @discounted_sale.end_date, start_date: @discounted_sale.start_date }
    end

    assert_redirected_to discounted_sale_path(assigns(:discounted_sale))
  end

  test "should show discounted_sale" do
    get :show, id: @discounted_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discounted_sale
    assert_response :success
  end

  test "should update discounted_sale" do
    patch :update, id: @discounted_sale, discounted_sale: { discount_percent: @discounted_sale.discount_percent, end_date: @discounted_sale.end_date, start_date: @discounted_sale.start_date }
    assert_redirected_to discounted_sale_path(assigns(:discounted_sale))
  end

  test "should destroy discounted_sale" do
    assert_difference('DiscountedSale.count', -1) do
      delete :destroy, id: @discounted_sale
    end

    assert_redirected_to discounted_sales_path
  end
end
