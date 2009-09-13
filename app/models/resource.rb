class Resource < ActiveRecord::Base
  belongs_to :subject
  
  validates_presence_of :subject_id
  
  def uri
    uri = read_attribute(:uri)
    
    if(uri.match(/^http:\/\//))
      uri
    else
      "http://" + uri
    end
  end
end
