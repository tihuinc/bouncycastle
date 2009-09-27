class Resource < ActiveRecord::Base
  belongs_to :subject
  has_many :votes

  validates_presence_of :subject_id

  def uri
    uri = read_attribute(:uri)

    if(uri.match(/^http:\/\//))
      uri
    else
      "http://" + uri
    end
  end

  def upvote_count
    votes.count(:conditions => { :up => true })
  end

  def downvote_count
    votes.count(:conditions => { :up => false })
  end
end
