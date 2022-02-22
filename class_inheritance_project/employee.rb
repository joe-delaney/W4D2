class Employee 
  # 1. init 
  # 2. getters 
  attr_reader :name, :title, :salary, :boss 

  def initialize (name, title, salary, boss=nil)
    @name = name 
    @title = title 
    @salary = salary
    @boss = boss
    boss.employees << self unless boss.nil?
  end 

  def bonus (mltply)
    return salary * mltply
  end


end