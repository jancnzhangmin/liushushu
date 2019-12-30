require "application_system_test_case"

class MytestsTest < ApplicationSystemTestCase
  setup do
    @mytest = mytests(:one)
  end

  test "visiting the index" do
    visit mytests_url
    assert_selector "h1", text: "Mytests"
  end

  test "creating a Mytest" do
    visit mytests_url
    click_on "New Mytest"

    fill_in "Age", with: @mytest.age
    fill_in "Name", with: @mytest.name
    click_on "Create Mytest"

    assert_text "Mytest was successfully created"
    click_on "Back"
  end

  test "updating a Mytest" do
    visit mytests_url
    click_on "Edit", match: :first

    fill_in "Age", with: @mytest.age
    fill_in "Name", with: @mytest.name
    click_on "Update Mytest"

    assert_text "Mytest was successfully updated"
    click_on "Back"
  end

  test "destroying a Mytest" do
    visit mytests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mytest was successfully destroyed"
  end
end
