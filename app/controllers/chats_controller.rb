class ChatsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @chats
  end

  def show
    render json: @chat
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.owner_id = current_user.id
    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
  end

  private
    def chat_params
      params.require(:chat).permit(:name)
    end
end
