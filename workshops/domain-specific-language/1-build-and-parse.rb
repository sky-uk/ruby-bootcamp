class Company
  class Department
    attr_reader :name,
                :employees

    def initialize(name, &block)
      @name = name
      @employees = []

      instance_eval(&block)
    end

    def employee(&block)
      @employees << Employee.new(&block)
    end
  end

  class Employee

    def initialize(&block)
      instance_eval(&block)
    end

    %w( first_name last_name role ).each do |method|
      define_method method do |*args|
        attribute = "@#{method}"

        if args.empty?
          self.instance_variable_get(attribute)
        else
          self.instance_variable_set(attribute, args.first)
        end
      end
    end
  end

  attr_reader :departments

  def initialize(&block)
    @departments = []

    instance_eval(&block)
  end

  def department(name, &block)
    departments << Department.new(name, &block)
  end
end

def company(&block)
  if block_given?
    @company = Company.new(&block)
  else
    @company
  end
end

require_relative 'run'
