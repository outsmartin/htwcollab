require 'test_helper'

class CodesnippetsControllerTest < ActionController::TestCase
  setup do
    @codesnippet = codesnippets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:codesnippets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create codesnippet" do
    assert_difference('Codesnippet.count') do
      post :create, codesnippet: @codesnippet.attributes
    end

    assert_redirected_to codesnippet_path(assigns(:codesnippet))
  end

  test "should show codesnippet" do
    get :show, id: @codesnippet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @codesnippet.to_param
    assert_response :success
  end

  test "should update codesnippet" do
    put :update, id: @codesnippet.to_param, codesnippet: @codesnippet.attributes
    assert_redirected_to codesnippet_path(assigns(:codesnippet))
  end

  test "should destroy codesnippet" do
    assert_difference('Codesnippet.count', -1) do
      delete :destroy, id: @codesnippet.to_param
    end

    assert_redirected_to codesnippets_path
  end
end
