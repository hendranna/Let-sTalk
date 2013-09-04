class ChatsController < ApplicationController

  load_and_authorize_resource

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.where(to_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chats }
    end
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chats = Chat.where("from_id = ? AND to_id = ? OR from_id = ? AND to_id = ?", current_user, params[:id], params[:id], current_user)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chats }
    end
  end

  # GET /chats/new
  # GET /chats/new.json
  def new
    @chat = Chat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chats }
    end
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new.where("from_id = ? AND to_id", current_user, params[:id])
    
    if @chat.save
      redirect_to @chat.user
    else
      format.html { render action: "new" }
      format.json { render json: @chat.errors, status: :unprocessable_entity }
    end
  end 

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat = Chat.find(params[:id])
    @user = @chat.user
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

end