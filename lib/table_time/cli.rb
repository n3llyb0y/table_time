require 'optparse'

module TableTime
  class Cli
    def initialize()
      @options = {}

      OptionParser.new do |option|
        option.on('--primes Integer') do |value|
          @options[:num_primes] = value.to_i
        end
        option.on('--fibs Integer') do |value|
          @options[:num_fibs] = value.to_i
        end
        option.on('--version') do
          puts "Table Time. Version: #{VERSION}"
          exit
        end
      end.parse!
    end

    def call
      sets = []

      if @options[:num_primes]
        sets << Util::Prime.take(@options[:num_primes])
      end

      if @options[:num_fibs]
        sets << Util::Fibonacci.take(@options[:num_fibs])
      end

      sets.each do |set|
        table = Table::SymmetricProduct.new set
        Formatter.new(table).render
      end
    end
  end
end
