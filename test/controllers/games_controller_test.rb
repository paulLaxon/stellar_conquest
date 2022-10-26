require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get board" do
    get games_board_url
    assert_response :success
  end

  test "should get index" do
    get games_index_url
    assert_response :success
  end

end
