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

  def account_update_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :producer
    )
  end

end
