class ProgramsController < ApplicationController
  before_action :authenticate_user!

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
    @lessons = @program.lessons.map do |lesson|
      sum_ratings = lesson.surveys.reduce(0) do |acc, survey|
        acc + ((survey.lo_rating + survey.delivery_rating + survey.comfort_rating) / 3)
      end
      lesson[:avg_rating] = sum_ratings.to_f / lesson.surveys.length
      lesson
    end
    if !current_user.programs.include?(@program)
      flash[:alert] = "You do not have access to this program"
      redirect_to programs_path
    end
  end

end
