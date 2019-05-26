class Api::V1::LaborTimesController < Api::V1::BaseController
  include GeneralConcern
  before_action :doorkeeper_authorize!
  before_action :set_labor_time, only: [:show]

  def index
    if current_resource_owner.admin?
      labor_times = LaborTime.all.order_created_at_desc
    else
      labor_times = current_resource_owner.labor_times.order_created_at_desc
    end
    json_response(labor_times)
  end

  def show
    json_response(@labor_time)
  end

  def create
    pending_labor_time = current_resource_owner.get_pending_labor_time
    if !pending_labor_time.nil?
      msg = {
          error: "pending labor time: #{get_date_formated(pending_labor_time.start_date.beginning_of_day, 0)}"
      }
      json_response(msg, :unprocessable_entity)
    else
      labor_time = current_resource_owner.labor_times.new
      labor_time.start_date = Time.now
      if labor_time.save
        json_response(labor_time, :created)
      else
        msg = {
            error: "cannot created labor time"
        }
        json_response(msg, :unprocessable_entity)
      end
    end
  end

  def finish_labor_time
    pending_labor_time = current_resource_owner.get_pending_labor_time
    msg = {}
    if pending_labor_time.nil?
      msg[:error] = "no pending labor time"
      json_response(msg, :unprocessable_entity)
    else
      pending_labor_time.finish!
      msg[:result] = "success"
      json_response(msg)
    end
  end

  private

  def set_labor_time
    @labor_time = LaborTime.find(params[:id])
  end

  def labor_time_params
    params.permit(:start_time)
  end
end
