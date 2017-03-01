class Lesson < ApplicationRecord
  belongs_to :program
  belongs_to :user
  alias_attribute :instructor, :user

  has_many :surveys
end
