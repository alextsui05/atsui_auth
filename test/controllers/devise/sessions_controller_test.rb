class Devise::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'POST /users/sign_in' do
    post user_session_path, params: { user: { email: users(:user1).email, password: 'foobarbaz' } }
    assert_equal 'sessions', @controller.controller_name
    assert_equal 'new', @controller.action_name

    post user_session_path, params: { user: { email: users(:user1).email, password: 'foobarfoo' } }
    assert_redirected_to root_path
  end
end
