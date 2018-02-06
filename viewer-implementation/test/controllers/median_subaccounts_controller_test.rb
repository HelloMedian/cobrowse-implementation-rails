require 'test_helper'

class MedianSubaccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @median_subaccount = median_subaccounts(:one)
  end

  test "should get index" do
    get median_subaccounts_url
    assert_response :success
  end

  test "should get new" do
    get new_median_subaccount_url
    assert_response :success
  end

  test "should create median_subaccount" do
    assert_difference('MedianSubaccount.count') do
      post median_subaccounts_url, params: { median_subaccount: { company_id: @median_subaccount.company_id, dev_mode: @median_subaccount.dev_mode, excluded_selectors: @median_subaccount.excluded_selectors, phone_mode: @median_subaccount.phone_mode, request_permission: @median_subaccount.request_permission, request_permission_text: @median_subaccount.request_permission_text, subaccount_id: @median_subaccount.subaccount_id } }
    end

    assert_redirected_to median_subaccount_url(MedianSubaccount.last)
  end

  test "should show median_subaccount" do
    get median_subaccount_url(@median_subaccount)
    assert_response :success
  end

  test "should get edit" do
    get edit_median_subaccount_url(@median_subaccount)
    assert_response :success
  end

  test "should update median_subaccount" do
    patch median_subaccount_url(@median_subaccount), params: { median_subaccount: { company_id: @median_subaccount.company_id, dev_mode: @median_subaccount.dev_mode, excluded_selectors: @median_subaccount.excluded_selectors, phone_mode: @median_subaccount.phone_mode, request_permission: @median_subaccount.request_permission, request_permission_text: @median_subaccount.request_permission_text, subaccount_id: @median_subaccount.subaccount_id } }
    assert_redirected_to median_subaccount_url(@median_subaccount)
  end

  test "should destroy median_subaccount" do
    assert_difference('MedianSubaccount.count', -1) do
      delete median_subaccount_url(@median_subaccount)
    end

    assert_redirected_to median_subaccounts_url
  end
end
