require 'test_helper'

class Admins::SiteBannersControllerTest < ActionController::TestCase
  setup do
    @admins_site_banner = admins_site_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins_site_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admins_site_banner" do
    assert_difference('Admins::SiteBanner.count') do
      post :create, admins_site_banner: {  }
    end

    assert_redirected_to admins_site_banner_path(assigns(:admins_site_banner))
  end

  test "should show admins_site_banner" do
    get :show, id: @admins_site_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admins_site_banner
    assert_response :success
  end

  test "should update admins_site_banner" do
    patch :update, id: @admins_site_banner, admins_site_banner: {  }
    assert_redirected_to admins_site_banner_path(assigns(:admins_site_banner))
  end

  test "should destroy admins_site_banner" do
    assert_difference('Admins::SiteBanner.count', -1) do
      delete :destroy, id: @admins_site_banner
    end

    assert_redirected_to admins_site_banners_path
  end
end
