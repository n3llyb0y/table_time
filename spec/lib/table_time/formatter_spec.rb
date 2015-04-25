require 'spec_helper'

describe TableTime::Formatter do
  subject { described_class.new(table) }

  Table = Struct.new(:xaxis, :yaxis) do
    def value_at(x, y)
      xaxis[x] + yaxis[y]
    end
  end

  describe '#render' do
    context 'increasing values' do
      let(:table) { Table.new([1, 2, 3], [1, 2, 3]) }

      it 'will retain correct spacing' do
        expect{ subject.render }.to output(expected_table1).to_stdout
      end
    end

    context 'mixed values' do
      let(:table) { Table.new([10, 2, 5], [90, 1, 5]) }

      it 'will retain correct spacing' do
        expect{ subject.render }.to output(expected_table2).to_stdout
      end
    end
  end

  def expected_table1
    "  | 1 2 3\n" \
    "--+------\n" \
    "1 | 2 3 4\n" \
    "2 | 3 4 5\n" \
    "3 | 4 5 6\n"
  end

  def expected_table2
    "   |  10  2  5\n" \
    "---+----------\n" \
    "90 | 100 92 95\n" \
    " 1 |  11  3  6\n" \
    " 5 |  15  7 10\n"
  end
end
