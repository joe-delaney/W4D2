require_relative 'employee.rb'
class Manager < Employee  
  attr_reader :employees

  def initialize (name, title, salary, boss=nil)
    super 
    @employees = []
  end

  def bonus (mltply)
    sum = 0 
    queue = [self]
    until queue.empty?
      current_employee = queue.shift
      if current_employee.is_a?(Manager)
        current_employee.employees.each do |employee|
          sum += employee.salary
          queue << employee
        end
      end
    end
    return sum * mltply
  end
end

ned = Manager.new('Ned', 'Founder', 1000000, nil)
dar = Manager.new('Daran', 'TA Manager', 78000, ned)
shaun = Employee.new('Shuana', 'TA', 12000, dar)
dav = Employee.new('David', 'TA', 10000, dar)

p ned.bonus(5) # => 500_000
p dar.bonus(4) # => 88_000
p dav.bonus(3) # => 30_000