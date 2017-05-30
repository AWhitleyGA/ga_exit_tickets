class RegistrationsController < Devise::RegistrationsController

  def show
    @user = current_user
    @programs = @user.programs
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      :producer
    )
  end

end
