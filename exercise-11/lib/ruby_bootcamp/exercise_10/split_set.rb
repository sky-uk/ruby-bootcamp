require_relative 'split'
module RubyBootcamp
  module Exercise10
    class SplitSet < Hash
      class InvalidSplitException < Exception;
      end

      def initialize(hash={})
        hash.each do |value, percentage|
          add(value.id, value, percentage)
        end
      end

      def add(id:, value:, percentage:)
        raise InvalidSplitException, 'splits must be a Fixnum' unless percentage.is_a?(Fixnum)
        lower = values.last ? values.last.upper : 0
        upper = lower + percentage

        raise InvalidSplitException, 'total split percentages can not be greater than 100%' if upper > 100
        self[id] = Split.new(lower, upper, value)
      end

      def resolve(*args)
        random = rand(100)
        result = values.find { |split| random >= split.lower && random < split.upper }
        result ? result.value : nil
      end

      def transform &block
        values.each do |split|
          split.value = block.call(split.value)
        end
      end

      def [] key
        result = super
        result && result.value
      end

      def valid?
        last = values.last
        return true if last && last.upper == 100

        warn('splits do not add up to 100% and no default has been specified')
        false
      end

    end
  end
end