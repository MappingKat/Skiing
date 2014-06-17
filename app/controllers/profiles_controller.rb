class ProfilesController < ApplicationController
  load_and_authorize_resource
  # urgent TODO: set up permissions so people can't edit others' profiles
  
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile

    respond_to do |format|
      format.html
      format.json { render json: @profile }
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    params[:profile][:resort_ids] = params[:profile][:resort_ids].split(",")
    @user = User.find(params[:user_id])
    @profile = @user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to user_profile_path(@user), notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
