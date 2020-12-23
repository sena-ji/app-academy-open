require "employee"

class Startup
    # getters
    attr_reader :name, :funding, :salaries, :employees

    # initializer
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    # instance methods
    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is not valid!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]

        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "not enough funding!"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        total = 0

        @employees.each do |employee|
            total += @salaries[employee.title]
        end

        total / self.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding

        another_startup.salaries.each do |title, salary|
            @salaries[title] = salary if !(@salaries.has_key?(title))
        end

        @employees += another_startup.employees

        another_startup.close
    end
end
