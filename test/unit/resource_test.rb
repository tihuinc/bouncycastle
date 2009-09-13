require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  def test_URL_format
    resource = Resource.new(:uri => "google.com")
    
    assert_equal "http://google.com", resource.uri
    resource.uri = "http://google.com"
    assert_equal "http://google.com", resource.uri
    
  end
end
