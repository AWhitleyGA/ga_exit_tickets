class Survey < ApplicationRecord
  belongs_to :lesson

  validates :respondent_name, presence: true
  validates :lo_rating, presence: true
  validates :delivery_rating, presence: true
  validates :comfort_rating, presence: true
  validates_inclusion_of :attended_office_hours, in: [true, false]

end
