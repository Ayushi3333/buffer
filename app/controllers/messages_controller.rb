class MessagesController < ApplicationController

  def index
    @messages = Message.find(params[:buddy_id]).all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @buddy = Buddy.find(params[:buddy_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.buddy = @buddy
    if @message.save
      redirect_to buddy_message_path(@buddy)
    else
      render 'messages/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
