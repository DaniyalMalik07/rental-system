module LeasesHelper
  def properties_available_for_rent
    Property.where(status: 0).map { |property| [property.address, property.id] }
  end
end
