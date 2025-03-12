# frozen_string_literal: true

module Luhn
  MIN_LENGTH = 2
  class << self
    def valid?(digits)
      return false unless numeric_string?(digits)

      checksum = digits[-1].to_i
      non_checksum = non_checksum_sum(digits.chop)
      sum = checksum + non_checksum
      sum % 10 == 0
    end
    def check_digit(partial_num)
      (10 - (non_checksum_sum(partial_num) % 10)) % 10
    end

    def generate(length: 16, prefix: nil)
      raise ArgumentError, 'length must be more than minimum' unless length.to_i > MIN_LENGTH

      raise ArgumentError, 'prefix length invalid' if prefix && (prefix.to_s.length + MIN_LENGTH >= length)

      raise ArgumentError, 'prefix must be numeric' if prefix && !numeric_string?(prefix)

      partial_num = (prefix&.empty? ? '' : prefix).to_s
      (length - 1 - partial_num.length).times do
        partial_num += rand(10).to_s
      end
      mod = 10 - (non_checksum_sum(partial_num) % 10)
      checksum = (mod == 10 ? 0 : mod).to_s
      partial_num + checksum
    end

    private

    def numeric_string?(str) = !!(str =~ /\A[-+]?[0-9]+\z/)

    def non_checksum_sum(partial_num)
      sum = 0
      partial_num.chars.map(&:to_i).reverse.each_with_index do |num, i|
        if i.even?
          num *= 2
          num -= 9 if num > 9
        end
        sum += num
      end
      sum
    end
  end
end