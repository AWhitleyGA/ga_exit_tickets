class SurveysController < ApplicationController
  before_action :authenticate_user!, only: [:show]

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
