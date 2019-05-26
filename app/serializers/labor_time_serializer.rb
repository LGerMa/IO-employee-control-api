class LaborTimeSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :worked_hours#, :user_id
  belongs_to :user
  def worked_hours
    object.worked_time
  end
end
