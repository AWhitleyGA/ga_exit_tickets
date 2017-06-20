class Survey < ApplicationRecord
  belongs_to :lesson

  validates :respondent_name, presence: true
  validates :lo_rating, presence: true
  validates :delivery_rating, presence: true
  validates :comfort_rating, presence: true
  validates_inclusion_of :attended_office_hours, in: [true, false]

  after_save :update_program_rating

  private

  def update_program_rating
    lesson = self.lesson
    sum_ratings = lesson.surveys.reduce(0) do |acc, survey|
      acc + ((survey.lo_rating + survey.delivery_rating + survey.comfort_rating) / 3)
    end
    lesson.avg_rating = (sum_ratings.to_f / lesson.surveys.length).round(1)
    lesson.save
  end

end
