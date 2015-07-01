module RubyBootcamp
  module Exercise10
    class Split
      attr_reader :upper, :lower
      attr_accessor :value

      def initialize lower, upper, value
        @upper, @lower, @value = upper, lower, value
      end

      def == other
        other.is_a?(Split) && other.lower == self.lower && other.upper == self.upper
      end
    end
  end
end