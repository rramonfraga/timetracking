class Project < ApplicationRecord
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  
  has_many :time_entries

  has_many :participations
  has_many :people, through: :participations

  validates :name, :description, presence: true

  def finish!
    
  end

  class << self
    def clean_old
      projects = where('created_at < ?', last_week)
      projects.destroy_all
    end

    def get_first_created(limit)
      order(created_at: :asc).limit(limit)
    end

    private

    def last_week
      Date.today - 1.week 
    end
  end
end
