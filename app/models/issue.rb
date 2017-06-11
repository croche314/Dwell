class Issue < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :unit
end
