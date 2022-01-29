require "application_system_test_case"

class MarquesTest < ApplicationSystemTestCase
  setup do
    @marque = marques(:one)
  end

  test "visiting the index" do
    visit marques_url
    assert_selector "h1", text: "Marques"
  end

  test "should create marque" do
    visit marques_url
    click_on "New marque"

    fill_in "Name", with: @marque.name
    click_on "Create Marque"

    assert_text "Marque was successfully created"
    click_on "Back"
  end

  test "should update Marque" do
    visit marque_url(@marque)
    click_on "Edit this marque", match: :first

    fill_in "Name", with: @marque.name
    click_on "Update Marque"

    assert_text "Marque was successfully updated"
    click_on "Back"
  end

  test "should destroy Marque" do
    visit marque_url(@marque)
    click_on "Destroy this marque", match: :first

    assert_text "Marque was successfully destroyed"
  end
end
