class ProgramsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.producer?
      @active_programs = Program.where(active: true).order(:created_at)
      @inactive_programs = Program.where(active: false).order(:created_at)
    else
      @active_programs = current_user.programs.where(active: true).order(:created_at)
      @inactive_programs = current_user.programs.where(active: false).order(:created_at)
    end
  end

  def show
    @program = Program.find(params[:id])
    @instructors = @program.users
    @lessons = @program.lessons.order(:date).map do |lesson|
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
    if !current_user.producer? && !current_user.programs.include?(@program)
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

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      redirect_to program_path(@program)
    else
      render :edit
    end
  end

  def destroy
    @program = Program.find(params[:id])
    if @program.destroy
      redirect_to programs_path
    else
      render :edit
    end
  end

  def manage
    @program = Program.find(params[:id])
    @membership = @program.memberships.new
    @instructors = @program.users
    @users = User.all.select do |user|
      !@instructors.include?(user)
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :location, :active)
  end
end
