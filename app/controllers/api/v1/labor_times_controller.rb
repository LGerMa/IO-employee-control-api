class Api::V1::LaborTimesController < Api::V1::BaseController
  include GeneralConcern
  before_action :doorkeeper_authorize!
  before_action :set_labor_time, only: [:show]

  def index
    labor_times = current_resource_owner.labor_times
    #render json: labor_times, adapter: :json
    render json: labor_times
  end

  def show
    render json: @labor_time
  end

  def create
    pending_labor_time = current_resource_owner.get_pending_labor_time
    if !pending_labor_time.nil?
      render json: {error: "pending labor time: #{get_date_formated(pending_labor_time.start_date.beginning_of_day, 0)}"}, status: 422
    else
      labor_time = current_resource_owner.labor_times.new
      if labor_time.save
        render json: labor_time, status: 201
      else
        render status: 422
      end
    end
  end

  def finish_labor_time
    pending_labor_time = current_resource_owner.get_pending_labor_time
    if pending_labor_time.nil?
      render json: {error: "no pending labor time"}, status: 422
    else
      pending_labor_time.finish!
      render json: {result: "success"}, status: 200
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
