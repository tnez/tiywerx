class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      flash[:success] = 'Profile was successfully updated.'
      redirect_to profile_path(@user)
    else
      flash[:danger] = 'There was a problem updating your profile.'
      render :edit
    end
  end

  ##################################################
  private
  def profile_params
    params.require(:user).permit(:handle,
                                 :blurb,
                                 :avatar)
  end
end
