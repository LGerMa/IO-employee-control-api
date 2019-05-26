class Api::V1::UsersController < Api::V1::BaseController
  before_action :doorkeeper_authorize!
  def me
    json_response(current_resource_owner)
  end
end
