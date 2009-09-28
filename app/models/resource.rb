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
    @upvote_count ||= votes.count(:conditions => { :up => true })
  end

  def downvote_count
    @downvote_count ||= votes.count(:conditions => { :up => false })
  end

  def netvote_count
    upvote_count - downvote_count
  end

  def total_count
    upvote_count + downvote_count
  end

  def percent_upvote
    upvote_count.to_f / total_count * 100
  end
end
