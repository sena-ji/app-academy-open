require_relative 'questions_database'

class User
  attr_accessor :fname, :lname
  attr_reader :id

  def self.find_by_id(id)
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['id']
    @lname = options['id']
  end


end