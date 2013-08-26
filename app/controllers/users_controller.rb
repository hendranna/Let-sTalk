class UsersController < ApplicationController

  # load_and_authorize_resource
  before_filter :authenticate_user!
  # def about
  #   @admin = []
  #   @users = User.all
  #   @users.each do |user|
  #     if user.role == "admin"
  #       @admins << user
  #     end
  #   end
  # end

 # GET /users
  # GET /users.json
  def index
    @users = User.all
    # order(:last_name).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
