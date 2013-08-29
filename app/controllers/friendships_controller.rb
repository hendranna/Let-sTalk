class FriendshipsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @friends = current_user.friends
  end


    


end
