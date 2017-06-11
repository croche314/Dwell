json.extract! issue, :id, :tenant_id, :unit_id, :category, :description, :urgency, :created_at, :updated_at
json.url issue_url(issue, format: :json)
