module TableTime
  module Table
    class SymmetricProduct
      def initialize(xy_values)
        @xy_values = xy_values
      end

      def xaxis
        @xy_values
      end

      def yaxis
        @xy_values
      end

      def value_at(x, y)
        xaxis[x] * yaxis[y]
      end
    end
  end
end
