class UsersController < ApplicationController
  def settings
    @user = current_user
    actor = params[:actor][:actor]
    start_time = int_to_tod(params[:actor]["availability_start_time(4i)"])
    end_time = int_to_tod(params[:actor]["availability_end_time(4i)"])

    @user.update(actor: actor,
                 availability_start_time: start_time,
                 availability_end_time: end_time)
    redirect_to edit_user_registration_path
  end

  private

  def int_to_tod(hour)
    Tod::TimeOfDay.new(hour)
  end
end
