require 'test_helper'

class DiscountedProductsControllerTest < ActionController::TestCase
  setup do
    @discounted_product = discounted_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discounted_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discounted_product" do
    assert_difference('DiscountedProduct.count') do
      post :create, discounted_product: { discounted_sale_id: @discounted_product.discounted_sale_id, product_id: @discounted_product.product_id }
    end

    assert_redirected_to discounted_product_path(assigns(:discounted_product))
  end

  test "should show discounted_product" do
    get :show, id: @discounted_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discounted_product
    assert_response :success
  end

  test "should update discounted_product" do
    patch :update, id: @discounted_product, discounted_product: { discounted_sale_id: @discounted_product.discounted_sale_id, product_id: @discounted_product.product_id }
    assert_redirected_to discounted_product_path(assigns(:discounted_product))
  end

  test "should destroy discounted_product" do
    assert_difference('DiscountedProduct.count', -1) do
      delete :destroy, id: @discounted_product
    end

    assert_redirected_to discounted_products_path
  end
end
