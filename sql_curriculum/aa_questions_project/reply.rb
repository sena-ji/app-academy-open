require_relative 'questions_database'

class Reply
  attr_accessor :body, :parent_reply_id, :subject_question_id, :user_id
  attr_reader :id

  def self.find_by_id(id)
    replies = 
  end
end