class Person < ApplicationRecord
  has_many :participations
  has_many :projects, through: :participations
end
