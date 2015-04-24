module TableTime
  module Util
    module Prime
      class << self
        def take(num)
          generate_upto(num) if num > 0
        end

        private

        def generate_upto(position)
          [2].tap do |prime|
            while prime.length < position
              n = prime.max + 1
              n += 1 until is_prime?(n)
              prime << n
            end
          end
        end

        # uses trial division http://en.wikipedia.org/wiki/Trial_division
        def is_prime?(num)
          2.upto(Math.sqrt(num)) do |i|
            return false if num % i == 0
          end
          true
        end
      end
    end
  end
end
