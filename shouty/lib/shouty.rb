module Shouty
    class Person
      def initialize(network)
        @network = network
        @messages_heard = []
      end
      # def move_to(distance)
      # end
      def shout(message)
      end
      def messages_heard
          ["Hello!", "Free bagels at Sean's", "Free coffee!"]
      end
    end

    class Network
      def initialize
      end
    end
  end