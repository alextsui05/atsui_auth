class Api::V1::CredentialsControllerTest < ActionDispatch::IntegrationTest
  test "should get me" do
    token = users(:user1).access_tokens.first.token
    get me_api_v1_credentials_url, headers: { "Authorization" => "Bearer #{token}" }
    assert_response :success
  end
end
