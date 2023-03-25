require 'test_helper'

class SplashsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get splashs_index_url
    assert_response :success
  end
end
