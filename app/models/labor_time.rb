class LaborTime < ApplicationRecord
  belongs_to :user

  enum labor_type: { 'labor': 0, 'license': 1}

  def finish!
    self.update!(end_date: Time.now, current_labor_time: false)
  end
end
