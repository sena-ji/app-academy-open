require_relative 'employee'

class Manager < Employee
  attr_reader :employees

  def initialize(employees, name, title, salary, boss)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)

  end
end