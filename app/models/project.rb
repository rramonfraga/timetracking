class Project < ApplicationRecord
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  
  has_many :time_entries

  has_many :participations
  has_many :people, through: :participations

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
