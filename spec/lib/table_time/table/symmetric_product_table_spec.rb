require 'spec_helper'

describe TableTime::Table::SymmetricProduct do
  subject { described_class.new(xy_values) }
  let(:xy_values) { [1, 2, 3] }

  describe '#xaxis' do
    subject { super().xaxis }

    it { should eql [1, 2, 3] }
  end

  describe '#yaxis' do
    subject { super().xaxis }

    it { should eql [1, 2, 3] }
  end

  describe '#value_at' do
    it 'will return the product of the xy_values' do
      (0..xy_values.length-1).each do |x|
        (0..xy_values.length-1).each do |y|
          expect(subject.value_at(x, y)).to eq xy_values[x] * xy_values[y]
        end
      end
    end
  end
end
