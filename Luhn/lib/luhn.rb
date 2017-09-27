require 'minitest'
module Luhn
  #double every other
  def self.is_valid?(number)
    doubles = []
    digits = number.to_s.split('').map(&:to_i)
    digits.reverse.each_with_index do |n, index|
      if index % 2 == 0
        doubles << n*2
      else
        doubles << n
      end
    end

    #subtract 9 if double is equal or greater than 10
    doubles.map do |i|
      if i >= 10
        i - 9
      end
    end
    #add the digits
    sum = doubles.inject(:+)

    #check if sum is divisible by 10(valid)
    return sum % 10 == 0
  end
end

class TestLuhn < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert  Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end

  def test_luhn_valid
    assert  Luhn.is_valid?(377681478627336)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(377681478627336)
  end
end