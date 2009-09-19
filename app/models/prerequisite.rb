class Prerequisite < ActiveRecord::Base
  belongs_to :subject
  belongs_to :prereq, :class_name => 'Subject'

  validates_presence_of :subject_id

  validate :non_recursive_prereqs

  private
    def non_recursive_prereqs
      errors.add_to_base('Subject can not be a prerequisite of itself') if subject_id == prereq_id
    end
end
