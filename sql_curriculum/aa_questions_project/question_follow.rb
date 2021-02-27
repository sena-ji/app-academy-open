require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'reply'
require_relative 'question_like'

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

    QuestionFollow.new(question_follow.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON question_follows.user_id = users.id
      JOIN
        questions ON question_follows.question_id = questions.id
      WHERE
        question_id = ?
    SQL

    followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)
    followings = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON question_follows.user_id = users.id
      JOIN
        questions ON question_follows.question_id = questions.id
      WHERE
        user_id = ?
    SQL

    followings.map { |following| Question.new(following) }
  end

  def self.most_followed_questions(n)
    most_followed = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON question_follows.question_id = questions.id
      GROUP BY
        question_follows.question_id
      ORDER BY
        COUNT(question_follows.user_id) DESC
      LIMIT
        ?
    SQL

    most_followed.map { |question| QuestionFollow.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end