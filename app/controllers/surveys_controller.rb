class SurveysController < ApplicationController

  def show
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:lesson_id])
    @survey = @lesson.surveys.find(params[:id])
    @instructor = @lesson.instructor
  end

  def new
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:lesson_id])
    @survey = @lesson.surveys.new
  end

  def create
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:lesson_id])
    @survey = @lesson.surveys.new(survey_params)
    if @survey.respondent_name == ""
      @survey.respondent_name = "Anonymous"
    end

    puts @survey.attended_office_hours
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
