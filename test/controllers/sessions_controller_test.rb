require 'test_helper'
#PR201
class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    fahim = users(:one)
    post :create, name: fahim.name, password: '12345'
    assert_redirected_to admin_url
    assert_equal fahim.id, session[:user_id]
  end

  test "should fail login" do
    fahim = users(:one)
    post :create, name: fahim.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
