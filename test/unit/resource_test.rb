require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  def test_URL_format
    resource = Resource.new(:uri => "google.com")

    assert_equal "http://google.com", resource.uri
    resource.uri = "http://google.com"
    assert_equal "http://google.com", resource.uri
  end

  def test_should_provide_upvote_count
    resource = Resource.create(:subject_id => 1)
    assert resource.valid?

    resource.votes.build(:up => true)
    resource.votes.build(:up => false)
    resource.save

    assert_equal(1, resource.upvote_count)
  end

  def test_should_provide_downvote_count
    resource = Resource.create(:subject_id => 1)
    assert resource.valid?

    resource.votes.build(:up => true)
    resource.votes.build(:up => false)
    resource.save

    assert_equal(1, resource.downvote_count)
  end

  def test_should_provide_netvote_count
    resource = Resource.create(:subject_id => 1)
    assert resource.valid?

    resource.votes.build(:up => true)
    resource.votes.build(:up => true)
    resource.votes.build(:up => false)
    resource.save

    assert_equal(1, resource.netvote_count)
  end
end
