class ProgramsController < ApplicationController

  def index
    if current_user.is_producer?
      @active_programs = Program.where(is_active?: true)
      @inactive_programs = Program.where(is_active?: false)
    else
      @active_programs = current_user.programs.where(is_active?: true)
      @inactive_programs = current_user.programs.where(is_active?: false)
    end
  end

  def show
    @program = Program.find(params[:id])
    @lessons = @program.lessons
  end

end
