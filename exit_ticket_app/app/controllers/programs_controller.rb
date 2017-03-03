class ProgramsController < ApplicationController

  def index
    @programs = Program.all
    @active_programs = Program.where(is_active?: true)
  end

  def show
    @program = Program.find(params[:id])
    @lessons = @program.lessons
  end

end
