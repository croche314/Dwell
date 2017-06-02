json.extract! tenant, :id, :landlord_id, :property_id, :unit_id, :first_name, :last_name, :birthdate, :phone, :email, :bio, :income, :smoker, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
