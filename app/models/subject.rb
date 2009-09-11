class Subject < ActiveRecord::Base
  has_many :prerequisites
  has_many :prereqs, :through => :prerequisites
  has_many :resources
end
