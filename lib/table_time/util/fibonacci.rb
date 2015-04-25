module TableTime
  module Util
    module Fibonacci
      class << self
        def take(num)
          (0...num).map{ |x| fib x }
        end

        # Basic interpretation http://en.wikipedia.org/wiki/Fibonacci_number
        def fib(num)
          return 0 if num == 0
          return 1 if num == 1

          fib(num - 1) + fib(num - 2)
        end
      end
    end
  end
end
