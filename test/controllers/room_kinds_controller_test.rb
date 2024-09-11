require "test_helper"

class RoomKindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_kind = room_kinds(:one)
  end

  test "should get index" do
    get room_kinds_url
    assert_response :success
  end

  test "should get new" do
    get new_room_kind_url
    assert_response :success
  end

  test "should create room_kind" do
    assert_difference("RoomKind.count") do
      post room_kinds_url, params: { room_kind: { bed: @room_kind.bed, name: @room_kind.name } }
    end

    assert_redirected_to room_kind_url(RoomKind.last)
  end

  test "should show room_kind" do
    get room_kind_url(@room_kind)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_kind_url(@room_kind)
    assert_response :success
  end

  test "should update room_kind" do
    patch room_kind_url(@room_kind), params: { room_kind: { bed: @room_kind.bed, name: @room_kind.name } }
    assert_redirected_to room_kind_url(@room_kind)
  end

  test "should destroy room_kind" do
    assert_difference("RoomKind.count", -1) do
      delete room_kind_url(@room_kind)
    end

    assert_redirected_to room_kinds_url
  end
end
