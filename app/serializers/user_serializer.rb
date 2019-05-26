class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :fullname, :got_pending_labor_time, :is_admin

  def got_pending_labor_time
    object.got_pending_labor_time?
  end

  def is_admin
    object.admin?
  end
end
