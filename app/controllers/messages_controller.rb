class MessagesController < ApplicationController
  load_and_authorize_resource :chat
  load_and_authorize_resource :message, through: :chat

  def index
    render json: @messages
  end

  def show
    render json: @message
  end

  def create
    @message = @chat.messages.build(message_params)
    @message.user = current_user
    if @message.save
      render json: @message, status: :created, location: [@chat, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
  end

  private
    def message_params
      params.require(:message).permit(:message)
    end
end
