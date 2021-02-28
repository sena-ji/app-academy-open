require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'

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

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.isntance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
    @subject_question_id = options['subject_question_id']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@subject_question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    children_replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL

    children_replies.map { |child_reply| Reply.new(child_reply) }
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @body, @parent_reply_id, @subject_question_id, @user_id, @id)
        UPDATE
          replies
        SET
          body = ?,
          parent_reply_id = ?,
          subject_question_id = ?,
          user_id = ?
        WHERE
          replies.id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @body, @parent_reply_id, @subject_question_id, @user_id)
        INSERT INTO
          replies (body, parent_reply_id, subject_question_id, user_id)
        VALUES
          (?, ?, ?, ?)
      SQL

      @id = QuestionsDatabase.last_insert_row_id
    end
  end
end