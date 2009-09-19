require 'test_helper'

class PrerequisiteTest < ActiveSupport::TestCase
  def test_should_validate_presence_of_subject
    p1 = Prerequisite.new
    assert !p1.valid?

    p2 = Prerequisite.new(:subject_id => 1)
    assert p2.valid?
  end

  def test_recursive_prerequisites_should_not_be_allowed
    p1 = Prerequisite.new(:subject_id => 1, :prereq_id => 2)
    assert p1.valid?

    p2 = Prerequisite.new(:subject_id => 1, :prereq_id => 1)
    assert !p2.valid?
  end
end
