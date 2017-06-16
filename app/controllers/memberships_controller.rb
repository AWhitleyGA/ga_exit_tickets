class MembershipsController < ApplicationController
  before_action :authenticate_user!


  def create
    @program = Program.find_by(name: params[:program_name])
    @membership = @program.memberships.new(membership_params)
    if @membership.save
      redirect_to manage_program_path(@program.name)
    else
      render "programs/manage"
    end
  end

  def destroy
    @program = Program.find_by(name: params[:program_name])
    @membership = @program.memberships.find_by(user_id: params[:id])
    @membership.destroy
    redirect_to manage_program_path(@program.name)
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end

end
