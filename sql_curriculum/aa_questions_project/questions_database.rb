require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

# This returns an array of hashes where each hash represents
# a row in the database. But we want an array of the class
# instances. So we map across this data (last line for this method).