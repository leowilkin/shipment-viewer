require_relative './shipment_types'

def get_shipments_for_user(email)
  shipments = []
  SHIPMENT_TYPES.each do |type|
    shipments.concat(type.find_by_email(email))
  end
  shipments.sort_by{|s| s.date || "1970-01-01"}.reverse
end

def user_has_any_shipments?(email)
  res = false
  SHIPMENT_TYPES.each do |type|
    res |= type.check_for_any_by_email email
  end
  res
end