require_relative 'questions_database'

class User
  attr_accessor :fname, :lname
  attr_reader :id

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE fname = ?
        AND lname = ?
    SQL

    User.new(user)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['id']
    @lname = options['id']
  end


end