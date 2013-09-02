class CommentsController < ApplicationController

  load_and_authorize_resource
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    # @comments = @user.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])

  end

  # POST /comments
  # POST /comments.json
  def create
    # params[:comment][:user_id] = params[:id]
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to :action => :show, :id => @comment.id
      # CommentMailer.comment_notification(@comment, @comment.user).deliver
      # user_path = user_path(@comment.user.id)
    else
      format.html { render action: "new" }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @user = @comment.user
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to user_path(user) }
      format.json { head :no_content }
    end
  end
end
