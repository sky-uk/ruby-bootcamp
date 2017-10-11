require_relative 'trick'

class Cat
  attr_reader :tricks

  # This constructor takes named parameters, If you've not seen them before then
  # have a read. They can be pretty useful and in the right circumstances can
  # make your code more readable
  def initialize(age:, name:)
    @name = name
    @age = age
    @tricks = {divide: Trick::DIVISION}
  end


  def age_in_human_years
    if @age > 2
      25 + calculate_remaining_years(@age - 2)
    else
      calculate_remaining_years(@age)
    end
  end

  def do_trick(name, *args)
    tricks[name].call(*args)
  end

  def print_age_in_human_years
    puts "I'm #{age_in_human_years} human years old"
  end

  private
  def calculate_remaining_years age
    age * 4
  end
end
