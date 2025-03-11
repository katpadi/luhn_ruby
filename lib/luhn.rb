# frozen_string_literal: true

module Luhn
  class << self
    def valid?(digits)
      return false unless numeric_string?(digits)

      checksum = digits[-1].to_i
      non_checksum = non_checksum_sum(digits.chop)
      sum = checksum + non_checksum
      sum % 10 == 0
    end

    def generate(length = 16)
      raise ArgumentError, 'length must be valid' if length.nil? || length < 2

      partial_num = ''
      (length - 1).times do
        partial_num += rand(10).to_s
      end
      mod = 10 - (non_checksum_sum(partial_num) % 10)
      checksum = (mod == 10 ? 0 : mod).to_s
      partial_num + checksum
    end

    private

    def numeric_string?(str)
      !!(str =~ /\A[-+]?[0-9]+\z/)
    end

    def non_checksum_sum(partial_num)
      sum = 0
      partial_num.chars.map(&:to_i).reverse.each_with_index do |num, i|
        if i.even?
          num *= 2
          num = num > 9 ? num - 9 : num
        end
        sum += num
      end
      sum
    end
  end
end