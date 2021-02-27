require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'reply'

class QuestionLike
  attr_accessor :user_id, :question_id
  attr_reader :id

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
       id = ?
    SQL

    QuestionLike.new(question_like.first)
  end

  def self.likers_for_question_id(question_id)
    question_likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        users ON question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL

    question_likers.map { |question_liker| User.new(question_liker) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end