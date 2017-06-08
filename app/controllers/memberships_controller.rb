class MembershipsController < ApplicationController
  before_action :authenticate_user!


  def create
    @program = Program.find(params[:program_id])
    @membership = @program.memberships.new(membership_params)
    if @membership.save
      redirect_to manage_program_path(@program)
    else
      render "programs/manage"
    end
  end

  def destroy
    @program = Program.find(params[:program_id])
    @membership = @program.memberships.find_by(user_id: params[:id])
    @membership.destroy
    redirect_to manage_program_path(@program)
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end

end
