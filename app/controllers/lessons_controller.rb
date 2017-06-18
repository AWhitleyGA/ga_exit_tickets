class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @program = Program.find_by(name: params[:program_name])

    respond_to do |format|
      format.csv {
        send_data Lesson.export_collection_to_csv(program: @program),
        :type => 'text/csv; charset=UTF-8;',
        :disposition => "attachment; filename=#{@program.name}_Lessons_#{Date.current}.csv"
      }
    end
  end

  def show
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:number])
    @surveys = @lesson.surveys.order(:created_at)
    @instructor = @lesson.instructor

    if @surveys.length > 0
      sum_lo = @surveys.reduce(0) do |acc, survey|
        acc + survey.lo_rating
      end
      @avg_lo_rating = (sum_lo.to_f / @surveys.length).round(1)

      sum_delivery = @surveys.reduce(0) do |acc, survey|
        acc + survey.delivery_rating
      end
      @avg_delivery_rating = (sum_delivery.to_f / @surveys.length).round(1)

      sum_comfort = @surveys.reduce(0) do |acc, survey|
        acc + survey.comfort_rating
      end
      @avg_comfort_rating = (sum_comfort.to_f / @surveys.length).round(1)
    else
      @avg_lo_rating = 0
      @avg_delivery_rating = 0
      @avg_comfort_rating = 0
    end

  end

  def new
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.new
    @suggested_lesson_number = @program.lessons.length
    @instructors = @program.users
  end

  def create
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.new(lesson_params)
    @instructors = @program.users
    if @lesson.save
      redirect_to program_lesson_path(@program.name, @lesson.number)
    else
      render :new
    end
  end

  def edit
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:number])
    @instructors = @program.users
  end

  def update
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:number])
    @instructors = @program.users
    if @lesson.update(lesson_params)
      redirect_to program_lesson_path(@program.name, @lesson.number)
    else
      render :edit
    end
  end

  def destroy
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:number])
    if @lesson.destroy
      redirect_to program_path(@program.name)
    else
      render :edit
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:number, :name, :date, :start_time, :end_time, :user_id)
  end
end
