require 'spec_helper'

describe TableTime::Util::Fibonacci do
  describe '.upto' do
    subject { described_class.take x }

    context 'with known sequence' do
      let(:x) { 21 }

      it 'will return an array of fibs upto x' do
        expect(subject).to eql known_21_fibs
      end
    end
  end

  describe '.fib' do
    subject { described_class }

    (0...21).each do |n|
      it "will return the fibonacci number at F#{n}" do
        expect(subject.fib n).to eql known_21_fibs[n]
      end
    end
  end

  def known_21_fibs
    [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144,
     233, 377, 610, 987, 1597, 2584, 4181, 6765]
  end
end
