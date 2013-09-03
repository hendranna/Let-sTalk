class UsersController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_user!
  
  # def about
  #   @admin = []
  #   @users = User.all
  #   @users.each do |user|
  #     if user.role == "admin"
  #       @admin << user
  #     end
  #   end
  # end

 # GET /users
  # GET /users.json
  def index
    @users = User.order(:lastname).page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @comment = Comment.new
    @comments = @user.comments
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

 
end
