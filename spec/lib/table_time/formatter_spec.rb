require 'spec_helper'

describe TableTime::Formatter do
  subject { described_class.new(table) }

  Table = Struct.new(:xaxis, :yaxis) do
    def value_at(x, y)
      xaxis[x] + yaxis[y]
    end
  end

  let(:table) { Table.new([1, 2, 3], [1, 2, 3]) }

  describe '#render' do
    it 'prints a formatted table to stdout' do
      expect{ subject.render }.to output(expected_table).to_stdout
    end
  end

  def expected_table
    "  | 1 2 3\n" \
    "--+------\n" \
    "1 | 2 3 4\n" \
    "2 | 3 4 5\n" \
    "3 | 4 5 6\n"
  end
end
