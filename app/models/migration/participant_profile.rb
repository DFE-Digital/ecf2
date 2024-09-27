module Migration
  class ParticipantProfile < Migration::Base
    self.inheritance_column = nil

    belongs_to :teacher_profile
    has_many :induction_records

    scope :ect, -> { where(type: "ParticipantProfile::ECT") }
    scope :mentor, -> { where(type: "ParticipantProfile::Mentor") }
    scope :ect_or_mentor, -> { ect.or(mentor) }
  end
end
