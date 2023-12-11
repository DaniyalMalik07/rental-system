require "application_system_test_case"

class LeasesTest < ApplicationSystemTestCase
  setup do
    @lease = leases(:one)
  end

  test "visiting the index" do
    visit leases_url
    assert_selector "h1", text: "Leases"
  end

  test "should create lease" do
    visit leases_url
    click_on "New lease"

    fill_in "End date", with: @lease.end_date
    fill_in "Property", with: @lease.property_id
    fill_in "Rent amount", with: @lease.rent_amount
    fill_in "Start date", with: @lease.start_date
    fill_in "Tenant", with: @lease.tenant_id
    click_on "Create Lease"

    assert_text "Lease was successfully created"
    click_on "Back"
  end

  test "should update Lease" do
    visit lease_url(@lease)
    click_on "Edit this lease", match: :first

    fill_in "End date", with: @lease.end_date
    fill_in "Property", with: @lease.property_id
    fill_in "Rent amount", with: @lease.rent_amount
    fill_in "Start date", with: @lease.start_date
    fill_in "Tenant", with: @lease.tenant_id
    click_on "Update Lease"

    assert_text "Lease was successfully updated"
    click_on "Back"
  end

  test "should destroy Lease" do
    visit lease_url(@lease)
    click_on "Destroy this lease", match: :first

    assert_text "Lease was successfully destroyed"
  end
end
