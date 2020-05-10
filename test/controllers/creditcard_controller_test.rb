require 'test_helper'

class CreditcardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get creditcard_new_url
    assert_response :success
  end

end
