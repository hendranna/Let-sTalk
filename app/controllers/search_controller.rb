class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash[:notice] = "Your search query was empty."
      redirect_to user_path
    else
      search = params[:q].to_s.downcase
      @languages = Language.where('LOWER(name) like :search', search: "%#{search}%")
      @users = User.where('LOWER(firstname) like :search OR LOWER(lastname) like :search OR LOWER(biography) like :search', search: "%#{search}%").page(params[:page])
    end
  end

  def search
    index
    render :index
  end

end