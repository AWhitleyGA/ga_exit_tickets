class LessonsController < ApplicationController
  def show
    @program = Program.find(params[:program_id])
    @lesson = @program.lessons.find(params[:id])
    @surveys = @lesson.surveys
    @instructor = @lesson.instructor

    sum_lo = @surveys.reduce(0) do |acc, survey|
      acc + survey.lo_rating
    end
    @avg_lo_rating = sum_lo.to_f / @surveys.length

    sum_delivery = @surveys.reduce(0) do |acc, survey|
      acc + survey.delivery_rating
    end
    @avg_delivery_rating = sum_delivery.to_f / @surveys.length

    sum_comfort = @surveys.reduce(0) do |acc, survey|
      acc + survey.comfort_rating
    end
    @avg_comfort_rating = sum_comfort.to_f / @surveys.length

  end
end
