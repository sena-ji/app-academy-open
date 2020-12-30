require_relative 'employee'

class Manager < Employee
  attr_reader :employees, :name, :title, :salary, :boss

  def initialize(employees, name, title, salary, boss = nil)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    get_total_salary(self) * multiplier
  end

  # tried to do this with recursion -> similar to the Array#flatten I implemented for the recursion homework
  # realized it was similar to dfs
  # found that bfs was easier to implement
  def get_total_salary(person)
    queue = person.employees

    total = 0
    until queue.empty?
      curr_person = queue.shift
      curr_person.employees.each { |employee| queue << employee } if curr_person.is_a?(Manager)
      total += curr_person.salary
    end

    total
  end
end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("David", "TA", 10000, "Darren")
  shawna = Employee.new("Shawna", "TA", 12000, "Darren")
  darren = Manager.new([shawna, david], "Darren", "TA Manager", 78000, "Ned")
  ned = Manager.new([darren], "Ned", "Founder", 1000000)

  puts ned.bonus(5)
  puts darren.bonus(4)
  puts david.bonus(3)
end