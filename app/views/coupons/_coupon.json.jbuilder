json.extract! coupon, :id, :coupon_code, :active, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)