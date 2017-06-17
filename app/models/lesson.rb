class Lesson < ApplicationRecord
  belongs_to :program
  belongs_to :user
  alias_attribute :instructor, :user

  has_many :surveys

  validates :number, :name, :date, :start_time, :end_time, :user_id, presence: true
  validates_uniqueness_of :number, scope: :program_id
end
