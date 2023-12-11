module PaymentsHelper
  def payment_methods
    Payment.payment_methods.keys.map { |key| [key.humanize, key] }
  end

  def month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, index| [name, index + 1] }
  end

  def properties_on_lease
    Lease.all.map { |lease| [lease.property.address, lease.id] }
  end
end
