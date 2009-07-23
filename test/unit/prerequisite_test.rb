require 'test_helper'

class PrerequisiteTest < ActiveSupport::TestCase
  def test_should_validate_presence_of_subject
    pre = Prerequisite.new
    assert !pre.valid?

    assert pre.valid?
  end
end
