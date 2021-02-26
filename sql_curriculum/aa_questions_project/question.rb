require_relative 'questions_database'

class Question
  attr_accessor :title, :body, :author_id

  def self.find_by_id(id)
    # This returns an array of hashes where each hash represents
    # a row in the database. But we want an array of the class
    # instances. So we map across this data (last line for this method).
    questions = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end


end