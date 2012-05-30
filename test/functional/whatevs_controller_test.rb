require 'test_helper'

class WhatevsControllerTest < ActionController::TestCase
  setup do
    @whatev = whatevs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whatevs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whatev" do
    assert_difference('Whatev.count') do
      post :create, :whatev => @whatev.attributes
    end

    assert_redirected_to whatev_path(assigns(:whatev))
  end

  test "should show whatev" do
    get :show, :id => @whatev.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @whatev.to_param
    assert_response :success
  end

  test "should update whatev" do
    put :update, :id => @whatev.to_param, :whatev => @whatev.attributes
    assert_redirected_to whatev_path(assigns(:whatev))
  end

  test "should destroy whatev" do
    assert_difference('Whatev.count', -1) do
      delete :destroy, :id => @whatev.to_param
    end

    assert_redirected_to whatevs_path
  end
end
