class Trick
  attr_reader :trick
  def initialize(&block)
    @trick = block
  end

  def call(*args)
    trick.call(*args)
  end

  DIVISION = Trick.new do |arg1, arg2|
    arg1/arg2
  end
end

