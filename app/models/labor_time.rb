class LaborTime < ApplicationRecord
  belongs_to :user

  enum labor_type: { 'labor': 0, 'license': 1}

  scope :order_created_at_desc, -> { order(created_at: :desc) }
  scope :pendings, -> { where(current_labor_time: true) }

  def finish!
    self.update!(end_date: Time.now, current_labor_time: false)
  end

  def worked_time
    end_date = self.end_date.nil? ? Time.now : self.end_date
    (end_date - start_date).to_i / 3600
  end
end
