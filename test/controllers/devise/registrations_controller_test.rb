class Devise::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_registration_url
    assert_response :success
  end

  test "should create user" do
    post user_registration_url, params: { user: { name: 'newbie', email: 'newbie@newbie.org', password: 'foobarfoo' } }
    assert_response :found
    assert User.find_by(name: 'newbie').present?
  end
end
