require "test_helper"

class SelectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selection = selections(:one)
  end

  test "should get index" do
    get selections_url
    assert_response :success
  end

  test "should get new" do
    get new_selection_url
    assert_response :success
  end

  test "should create selection" do
    assert_difference("Selection.count") do
      post selections_url, params: { selection: { company_id: @selection.company_id, es_deadline: @selection.es_deadline, is_intern: @selection.is_intern, next_plan: @selection.next_plan, note: @selection.note, plan_date: @selection.plan_date, status: @selection.status } }
    end

    assert_redirected_to selection_url(Selection.last)
  end

  test "should show selection" do
    get selection_url(@selection)
    assert_response :success
  end

  test "should get edit" do
    get edit_selection_url(@selection)
    assert_response :success
  end

  test "should update selection" do
    patch selection_url(@selection), params: { selection: { company_id: @selection.company_id, es_deadline: @selection.es_deadline, is_intern: @selection.is_intern, next_plan: @selection.next_plan, note: @selection.note, plan_date: @selection.plan_date, status: @selection.status } }
    assert_redirected_to selection_url(@selection)
  end

  test "should destroy selection" do
    assert_difference("Selection.count", -1) do
      delete selection_url(@selection)
    end

    assert_redirected_to selections_url
  end
end
