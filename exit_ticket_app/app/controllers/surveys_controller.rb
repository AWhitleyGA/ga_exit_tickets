class SurveysController < ApplicationController
  def new
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:lesson_id])
    @survey = @lesson.surveys.new
  end

  def create
    puts params
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:lesson_id])
    @survey = @lesson.surveys.create!(survey_params)
  end

  private

  def survey_params
    params.require(:survey).permit(:respondent_name, :lo_rating, :delivery_rating, :comfort_rating, :positive_comment, :negative_comment, :general_comment, :attended_office_hours)
  end
end
