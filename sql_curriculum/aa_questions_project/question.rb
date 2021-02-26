require_relative 'questions_database'

class Question
  attr_accessor :title, :body, :author_id
  attr_reader :id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    # Reason why the question array was not mapped was because
    # there is only one id for each question entry. There will
    # never be a question that has the same id or a question
    # that has multiple ids. We want to pass in a hash, so 
    # .first method will be used to pass the hash.
    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end


end