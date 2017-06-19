json.extract! account, :id, :tenant_id, :landlord_id, :name, :primary, :account_type, :card_type, :account_number, :expiration, :created_at, :updated_at
json.url account_url(account, format: :json)
