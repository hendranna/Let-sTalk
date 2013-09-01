class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash[:notice] = "Your search query was empty."
      redirect_to user_path
    else
      search = params[:q].to_s.downcase
      @albums = Language.where('LOWER(name) like :search', search: "%#{search}%")
      @users = User.where('LOWER(username) like :search OR LOWER(firstname) like :search OR LOWER(lastname) like :search OR LOWER(biography) like :search', search: "%#{search}%")
    end
  end

  def search
    index
    render :index
  end

end