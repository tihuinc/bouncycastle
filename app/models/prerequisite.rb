class Prerequisite < ActiveRecord::Base
  belongs_to :subject
  belongs_to :prereq, :class_name => 'Subject'

  validates_presence_of :subject_id
end
