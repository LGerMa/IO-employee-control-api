class LaborTime < ApplicationRecord
  belongs_to :user

  enum labor_type: { 'labor': 0, 'license': 1}
end
