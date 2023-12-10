module PropertiesHelper
  def property_statuses
    Property.statuses.keys.map { |key| [key.humanize, key] }
  end
end
