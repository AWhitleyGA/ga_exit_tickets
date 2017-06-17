class Lesson < ApplicationRecord
  belongs_to :program
  belongs_to :user
  alias_attribute :instructor, :user

  has_many :surveys

  validates_uniqueness_of :number, scope: :program_id
end
