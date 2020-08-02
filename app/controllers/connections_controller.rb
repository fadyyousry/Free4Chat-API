class ConnectionsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @connections
  end

  def show
    render json: @connections
  end

  def create
    @connection = Connection.new(connection_params)
    @connection.user = current_user
    if @connection.save
      render json: @connection, status: :created, location: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @connection.destroy
  end

  private
    def connection_params
      params.require(:connection).permit(:chat_id)
    end
end
