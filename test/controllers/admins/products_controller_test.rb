require 'test_helper'

class Admins::ProductsControllerTest < ActionController::TestCase
  setup do
    @admins_product = admins_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_product" do
    assert_difference('Admins::Product.count') do
      post :create, admins_product: {  }
    end

    assert_redirected_to admins_product_path(assigns(:admins_product))
  end

  test "should show admins_product" do
    get :show, id: @admins_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admins_product
    assert_response :success
  end

  test "should update admins_product" do
    patch :update, id: @admins_product, admins_product: {  }
    assert_redirected_to admins_product_path(assigns(:admins_product))
  end

  test "should destroy admins_product" do
    assert_difference('Admins::Product.count', -1) do
      delete :destroy, id: @admins_product
    end

    assert_redirected_to admins_products_path
  end
end
