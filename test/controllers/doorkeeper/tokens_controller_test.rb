class Doorkeeper::TokensControllerTest < ActionDispatch::IntegrationTest
  test 'POST /oauth/token should handle password_grant type' do
    post oauth_token_path, params: { grant_type: 'password', name: users(:user1).name, password: 'foobarfoo' }

    assert_response :success
    %w(access_token token_type expires_in refresh_token created_at).each do |key|
      assert_includes JSON.parse(@response.body), key
    end
    assert_instance_of String, JSON.parse(@response.body)['access_token']
    assert_instance_of String, JSON.parse(@response.body)['refresh_token']
  end

  test 'POST /oauth/token should handle refresh_token type' do
    post oauth_token_path, params: { grant_type: 'password', name: users(:user1).name, password: 'foobarfoo' }

    post oauth_token_path, params: { grant_type: 'refresh_token', refresh_token: users(:user1).access_tokens.last.refresh_token }

    assert_response :success
    %w(access_token token_type expires_in refresh_token created_at).each do |key|
      assert_includes JSON.parse(@response.body), key
    end
    assert_instance_of String, JSON.parse(@response.body)['access_token']
    assert_instance_of String, JSON.parse(@response.body)['refresh_token']
  end
end
