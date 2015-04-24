require 'optparse'

module TableTime
  class Cli
    def initialize()
      @options = {}

      OptionParser.new do |option|
        option.on('--primes Integer') do |value|
          @options[:num_primes] = value.to_i
        end
        option.on('--version') do
          puts "Table Time. Version: #{VERSION}"
          exit
        end
      end.parse!
    end

    def call
      primes = Util::Prime.take @options[:num_primes]
      table = Table::SymmetricProduct.new primes
      Formatter.new(table).render
    end
  end
end
