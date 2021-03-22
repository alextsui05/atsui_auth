class DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'GET /dashboard' do
    sign_in_as(users(:user1))
    get root_path
    assert_includes @response.body, 'Dashboard'
  end
end
