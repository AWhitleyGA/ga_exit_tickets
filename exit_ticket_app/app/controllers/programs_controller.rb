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
    @instructors = @program.users.select do |user|
      !user.is_producer?
    end
    @lessons = @program.lessons.map do |lesson|
      sum_ratings = lesson.surveys.reduce(0) do |acc, survey|
        acc + ((survey.lo_rating + survey.delivery_rating + survey.comfort_rating) / 3)
      end
      if lesson.surveys.length > 0
        lesson[:avg_rating] = (sum_ratings.to_f / lesson.surveys.length).round(1)
      else
        lesson[:avg_rating] = 0
      end
      lesson
    end
    if !current_user.is_producer? && !current_user.programs.include?(@program)
      flash[:alert] = "You do not have access to this program"
      redirect_to programs_path
    end
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to program_path(@program)
    else
      render :new
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :location)
  end
end
