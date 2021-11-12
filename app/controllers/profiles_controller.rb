class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    current_user.update!(params.require(:user).permit(:info))
  end
end
