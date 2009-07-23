class Subject < ActiveRecord::Base
  has_many :prerequisites
  has_many :prereqs, :through => :prerequisites
end
