class ChatsController < ApplicationController

  load_and_authorize_resource

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chats }

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chat = Chat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chat }
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
    @comment = Comment.new(params[:comment])
    @comment.user = User.find(params[:user_id])
    @comment.writer = current_user

    if @comment.save
      redirect_to @chat.user
    else
      format.html { render action: "new" }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat = Chat.find(params[:id])
    @user = @chat.user
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to user_path(user) }
      format.json { head :no_content }
    end
  end


    end
  end
end
