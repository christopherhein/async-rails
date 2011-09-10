require 'test_helper'

class WidgetsControllerTest < ActionController::TestCase

  test "should get index" do
    EventMachine.synchrony do
      get :index
      assert_response :success
      EventMachine.stop
    end
  end

end
