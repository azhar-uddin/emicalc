require 'test_helper'

class EmicalcControllerTest < ActionController::TestCase
  test "should get calc" do
    get :calc
    assert_response :success
  end

end
