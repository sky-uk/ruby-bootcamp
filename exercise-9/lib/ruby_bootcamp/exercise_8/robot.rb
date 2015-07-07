module RubyBootcamp
  module Exercise8
    class Robot
      attr_reader :position

      def initialize(name)
        @name = name

        @greetings = ['hello', 'good day', "what's up", 'yo', 'hi', 'sup', 'hey']
        @goodbyes = ['goodbye', 'see you later', 'in a while crocodile', 'l8rs', 'bye for now']
        @position  = {logitude: 0, lattitude: 0 }
      end

      def say (message)
        puts message.downcase
      end

      def shout(message)
        puts "#{message.upcase}!!!"
      end

      def greeting
        @greetings.sample
      end

      def farewell
        @goodbyes.sample
      end

      def move(direction)
        plane,amount = nil, nil
        if  %i{left right}.include?(direction)
          plane, amount = :lattitude, (direction == :left ? 1 : -1)
        elsif %i{forwards backwards}
          plane, amount = :logitude, (direction == :forwards ? 1 : -1)
        else
          raise InvalidDirectionException, "I just don't move like that"
        end

        position[plane]+= amount
        self
      end

      def move_left
        move :left
      end

      def move_right
        move :right
      end

      def move_forwards
        move :forwards
      end

      def move_backwards
        move :backwards
      end

      def tell_me_the_time
        say "#{greeting}, the time is #{Time.now}"
      end

      def fire_laser
        shout 'firing laser'
      end
    end
  end
end
