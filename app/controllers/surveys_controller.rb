class SurveysController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:lesson_number])

    respond_to do |format|
      format.csv {
        send_data Survey.export_collection_to_csv(lesson: @lesson),
        :type => 'text/csv; charset=UTF-8;',
        :disposition => "attachment; filename=#{@program.name}_#{@lesson.name}_Surveys_#{Date.current}.csv"
      }
    end
  end

  def show
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:lesson_number])
    @survey = @lesson.surveys.find(params[:id])
    @instructor = @lesson.instructor
  end

  def new
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:lesson_number])
    @survey = @lesson.surveys.new
  end

  def create
    @program = Program.find_by(name: params[:program_name])
    @lesson = @program.lessons.find_by(number: params[:lesson_number])
    @survey = @lesson.surveys.new(survey_params)

    if @survey.respondent_name == ""
      @survey.respondent_name = "Anonymous"
    end

    if @survey.save
      render :confirm
    else
      render :new
    end

  end

  private

  def survey_params
    params.require(:survey).permit(:respondent_name, :lo_rating, :delivery_rating, :comfort_rating, :positive_comment, :negative_comment, :general_comment, :attended_office_hours)
  end
end
