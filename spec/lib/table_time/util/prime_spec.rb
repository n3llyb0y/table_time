require 'spec_helper'

describe TableTime::Util::Prime do
  describe '.take' do
    context 'compared to pre-computed prime positions' do
      1.upto(100).each do |position|
        it "will return an array of prime numbers up to position #{position}" do
          expect(subject.take(position)).to eql one_hundred_known_primes[0, position]
        end
      end
    end

    context 'compared to unknown primes' do
      it "will compute a prime value at position 200" do
        subject.take(200).each do |num|
          expect(is_prime?(num)).to be true
        end
      end
    end
  end

  def is_prime?(num)
    return false if num < 2

    # naive but extremely thorough test
    # of all divisors upto num/2
    2.upto(num / 2) do |i|
      return false if num % i == 0
    end

    true
  end

  def one_hundred_known_primes
    [   2,   3,   5,   7,  11,  13,  17,  19,  23,  29,
       31,  37,  41,  43,  47,  53,  59,  61,  67,  71,
       73,  79,  83,  89,  97, 101, 103, 107, 109, 113,
      127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
      179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
      233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
      283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
      353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
      419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
      467, 479, 487, 491, 499, 503, 509, 521, 523, 541  ]
  end
end
