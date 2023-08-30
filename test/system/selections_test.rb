require "application_system_test_case"

class SelectionsTest < ApplicationSystemTestCase
  setup do
    @selection = selections(:one)
  end

  test "visiting the index" do
    visit selections_url
    assert_selector "h1", text: "Selections"
  end

  test "should create selection" do
    visit selections_url
    click_on "New selection"

    fill_in "Company", with: @selection.company_id
    fill_in "Es deadline", with: @selection.es_deadline
    fill_in "Is intern", with: @selection.is_intern
    fill_in "Next plan", with: @selection.next_plan
    fill_in "Note", with: @selection.note
    fill_in "Plan date", with: @selection.plan_date
    fill_in "Status", with: @selection.status
    click_on "Create Selection"

    assert_text "Selection was successfully created"
    click_on "Back"
  end

  test "should update Selection" do
    visit selection_url(@selection)
    click_on "Edit this selection", match: :first

    fill_in "Company", with: @selection.company_id
    fill_in "Es deadline", with: @selection.es_deadline
    fill_in "Is intern", with: @selection.is_intern
    fill_in "Next plan", with: @selection.next_plan
    fill_in "Note", with: @selection.note
    fill_in "Plan date", with: @selection.plan_date
    fill_in "Status", with: @selection.status
    click_on "Update Selection"

    assert_text "Selection was successfully updated"
    click_on "Back"
  end

  test "should destroy Selection" do
    visit selection_url(@selection)
    click_on "Destroy this selection", match: :first

    assert_text "Selection was successfully destroyed"
  end
end
