class Api::V1::CredentialsController < Api::V1::ApplicationController
  before_action :doorkeeper_authorize!

  def me
    render json: { message: 'Hello world!' }
  end
end
