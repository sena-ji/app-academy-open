require_relative 'questions_database'

class QuestionFollow
  attr_accessor :user_id, :question_id
  attr_reader :id

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    return nil unless question_follow.length > 0

    QuestionFollow.new(question_follow)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  
end