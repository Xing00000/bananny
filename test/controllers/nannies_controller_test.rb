require 'test_helper'

class NanniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nanny = nannies(:one)
  end

  test "should get index" do
    get nannies_url
    assert_response :success
  end

  test "should get new" do
    get new_nanny_url
    assert_response :success
  end

  test "should create nanny" do
    assert_difference('Nanny.count') do
      post nannies_url, params: { nanny: {  } }
    end

    assert_redirected_to nanny_url(Nanny.last)
  end

  test "should show nanny" do
    get nanny_url(@nanny)
    assert_response :success
  end

  test "should get edit" do
    get edit_nanny_url(@nanny)
    assert_response :success
  end

  test "should update nanny" do
    patch nanny_url(@nanny), params: { nanny: {  } }
    assert_redirected_to nanny_url(@nanny)
  end

  test "should destroy nanny" do
    assert_difference('Nanny.count', -1) do
      delete nanny_url(@nanny)
    end

    assert_redirected_to nannies_url
  end
end
