class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :labor_times
  has_many :tokens, class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id
  has_one :current_token, -> { order 'created_at DESC' }, class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id

  enum role: {user: 0, admin: 1}

  def get_pending_labor_time
    pending_labor_times = labor_times.where(end_date: nil).order(start_date: :desc)
    pending_labor_times.nil? ? nil : pending_labor_times.first
  end

  class << self
    def authenticate!(email, password)
      user = User.find_for_authentication(email: email)
      user.try(:valid_password?, password) ? user : nil
    end
  end
end
