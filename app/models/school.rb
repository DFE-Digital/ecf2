class School < ApplicationRecord
  # Associations
  belongs_to :gias_school, class_name: "GIAS::School", foreign_key: :urn
  has_many :ect_at_school_periods, inverse_of: :school
  has_many :mentor_at_school_periods, inverse_of: :school

  # Validations
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :urn,
            presence: true,
            uniqueness: true

  # Instance Methods
  def to_param
    urn
  end
end
