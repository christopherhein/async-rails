require 'test_helper'
require "em-synchrony"

class WidgetsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

end
