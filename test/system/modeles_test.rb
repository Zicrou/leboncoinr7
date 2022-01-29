require "application_system_test_case"

class ModelesTest < ApplicationSystemTestCase
  setup do
    @modele = modeles(:one)
  end

  test "visiting the index" do
    visit modeles_url
    assert_selector "h1", text: "Modeles"
  end

  test "should create modele" do
    visit modeles_url
    click_on "New modele"

    fill_in "Name", with: @modele.name
    click_on "Create Modele"

    assert_text "Modele was successfully created"
    click_on "Back"
  end

  test "should update Modele" do
    visit modele_url(@modele)
    click_on "Edit this modele", match: :first

    fill_in "Name", with: @modele.name
    click_on "Update Modele"

    assert_text "Modele was successfully updated"
    click_on "Back"
  end

  test "should destroy Modele" do
    visit modele_url(@modele)
    click_on "Destroy this modele", match: :first

    assert_text "Modele was successfully destroyed"
  end
end
