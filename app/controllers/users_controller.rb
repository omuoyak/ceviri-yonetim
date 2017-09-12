class UsersController < ApplicationController

  def show
    @User = User.includes(:profile).find(params[:id])
  end

end
