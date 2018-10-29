class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee

  def initialize(name, title, salary, subordinates)
    super(name, title, salary)
    @subordinates = subordinates
  end

  def assign_boss
    @subordinates.each do |ele|
      ele.boss = self
    end
  end

  def bonus(multiplier)
    @subordinates.reduce(0){|total_sub_salary,el| total_sub_salary += el.salary}

    total_sub_salary * multiplier
  end
end
