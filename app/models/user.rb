class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :programs, through: :memberships
  has_many :lessons
  alias_attribute :lessons_taught, :lessons
end
