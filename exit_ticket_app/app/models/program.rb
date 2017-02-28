class Program < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :lessons
end
