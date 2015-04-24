require 'spec_helper'

describe 'table time command' do
  context '--primes' do
    it 'will build a balanced table of prime products and print to screen' do
      expect(`ruby #{Dir.pwd}/bin/table_time --primes 10`).to eql expected_output
    end
  end

  def expected_output
    "   |  2  3   5   7  11  13  17  19  23  29\n" \
    "---+--------------------------------------\n" \
    " 2 |  4  6  10  14  22  26  34  38  46  58\n" \
    " 3 |  6  9  15  21  33  39  51  57  69  87\n" \
    " 5 | 10 15  25  35  55  65  85  95 115 145\n" \
    " 7 | 14 21  35  49  77  91 119 133 161 203\n" \
    "11 | 22 33  55  77 121 143 187 209 253 319\n" \
    "13 | 26 39  65  91 143 169 221 247 299 377\n" \
    "17 | 34 51  85 119 187 221 289 323 391 493\n" \
    "19 | 38 57  95 133 209 247 323 361 437 551\n" \
    "23 | 46 69 115 161 253 299 391 437 529 667\n" \
    "29 | 58 87 145 203 319 377 493 551 667 841\n"
  end
end
