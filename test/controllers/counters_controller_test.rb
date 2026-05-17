require "test_helper"

class CountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    Counter.destroy_all
    Counter.create!(plus: 0, minus: 0)
  end

  test "should get show" do
    get root_url
    assert_response :success
    assert_select "button", text: "+"
    assert_select "button", text: "−"
  end

  test "should increment plus" do
    assert_difference -> { Counter.instance.reload.plus }, 1 do
      post increment_plus_url
    end
    assert_redirected_to root_url
  end

  test "should increment minus" do
    assert_difference -> { Counter.instance.reload.minus }, 1 do
      post increment_minus_url
    end
    assert_redirected_to root_url
  end
end
