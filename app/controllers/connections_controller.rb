class ConnectionsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :is_connected

  def index
    render json: @connections.where(chat_id: params[:chat_id])
  end

  def is_connected
    @connection = current_user.connections.where(chat_id: params[:chat_id])
    render :json => {connected:  @connection.exists?}
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

  def update
    if @connection.update(status_param)
      render json: @connection
    else
      render json: @connection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @connection.destroy
  end

  private
    def status_param
      params.require(:connection).permit(:status)
    end

    def connection_params
      params.require(:connection).permit(:chat_id)
    end
end
