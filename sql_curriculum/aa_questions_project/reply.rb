require_relative 'questions_database'

class Reply
  attr_accessor :body, :parent_reply_id, :subject_question_id, :user_id
  attr_reader :id

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
    @subject_question_id = options['subject_question_id']
    @user_id = options['user_id']
  end
end