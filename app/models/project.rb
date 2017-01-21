class Project < ApplicationRecord
  has_many :time_entries

  validates :name, :description, presence: true

  class << self
    def clean_old
      projects = where('created_at < ?', last_week)
      projects.destroy_all
    end

    private

    def last_week
      Date.today - 1.week 
    end
  end
end
