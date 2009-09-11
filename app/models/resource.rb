class Resource < ActiveRecord::Base
  belongs_to :subject
  
  validates_presence_of :subject_id
end
