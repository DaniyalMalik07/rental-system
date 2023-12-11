require "test_helper"

class LeasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lease = leases(:one)
  end

  test "should get index" do
    get leases_url
    assert_response :success
  end

  test "should get new" do
    get new_lease_url
    assert_response :success
  end

  test "should create lease" do
    assert_difference("Lease.count") do
      post leases_url, params: { lease: { end_date: @lease.end_date, property_id: @lease.property_id, rent_amount: @lease.rent_amount, start_date: @lease.start_date, tenant_id: @lease.tenant_id } }
    end

    assert_redirected_to lease_url(Lease.last)
  end

  test "should show lease" do
    get lease_url(@lease)
    assert_response :success
  end

  test "should get edit" do
    get edit_lease_url(@lease)
    assert_response :success
  end

  test "should update lease" do
    patch lease_url(@lease), params: { lease: { end_date: @lease.end_date, property_id: @lease.property_id, rent_amount: @lease.rent_amount, start_date: @lease.start_date, tenant_id: @lease.tenant_id } }
    assert_redirected_to lease_url(@lease)
  end

  test "should destroy lease" do
    assert_difference("Lease.count", -1) do
      delete lease_url(@lease)
    end

    assert_redirected_to leases_url
  end
end
