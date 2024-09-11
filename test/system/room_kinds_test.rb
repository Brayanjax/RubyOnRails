require "application_system_test_case"

class RoomKindsTest < ApplicationSystemTestCase
  setup do
    @room_kind = room_kinds(:one)
  end

  test "visiting the index" do
    visit room_kinds_url
    assert_selector "h1", text: "Room kinds"
  end

  test "should create room kind" do
    visit room_kinds_url
    click_on "New room kind"

    fill_in "Bed", with: @room_kind.bed
    fill_in "Name", with: @room_kind.name
    click_on "Create Room kind"

    assert_text "Room kind was successfully created"
    click_on "Back"
  end

  test "should update Room kind" do
    visit room_kind_url(@room_kind)
    click_on "Edit this room kind", match: :first

    fill_in "Bed", with: @room_kind.bed
    fill_in "Name", with: @room_kind.name
    click_on "Update Room kind"

    assert_text "Room kind was successfully updated"
    click_on "Back"
  end

  test "should destroy Room kind" do
    visit room_kind_url(@room_kind)
    click_on "Destroy this room kind", match: :first

    assert_text "Room kind was successfully destroyed"
  end
end
