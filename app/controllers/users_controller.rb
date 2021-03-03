class UsersController < ApplicationController
  def settings
    authorize @user = current_user
    attributes = {
      actor: true,
      availability_start_time: int_to_tod(params[:actor]["availability_start_time(4i)"]),
      availability_end_time: int_to_tod(params[:actor]["availability_end_time(4i)"]),
    }
    if @user.update(attributes)
      flash[:success] = "You succesfully modified your settings"
    else
      flash[:alert] = "Something went wrong!"
    end
    redirect_to edit_user_registration_path
  end

  private

  def int_to_tod(hour)
    Tod::TimeOfDay.new(hour.to_i)
  end
end
