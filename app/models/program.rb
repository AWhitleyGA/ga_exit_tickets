class Program < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :lessons

  validates :name, presence: true
  validates :location, presence: true
  validates_uniqueness_of :name
end
