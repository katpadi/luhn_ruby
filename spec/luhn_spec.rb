# frozen_string_literal: true

RSpec.describe Luhn do
  it "has a version number" do
    expect(Luhn::VERSION).not_to be nil
  end

  describe '.valid?' do
    it "returns true if valid digits" do
      expect(Luhn.valid?('38520000023237')).to be_truthy
      expect(Luhn.valid?('1230')).to be_truthy
      expect(Luhn.valid?('1996008')).to be_truthy
      expect(Luhn.valid?('371449635398431')).to be_truthy
      expect(Luhn.valid?('34')).to be_truthy
    end

    it "returns false if invalid digits" do
      expect(Luhn.valid?('4111111111111112')).to be_falsey
      expect(Luhn.valid?('371449635398439')).to be_falsey
      expect(Luhn.valid?('378282246310006')).to be_falsey
      expect(Luhn.valid?('49927398713')).to be_falsey
    end

    it 'returns false if argument contains non-numeric' do
      expect(subject.valid?('katpadi')).to be_falsey
      expect(subject.valid?('katpad1')).to be_falsey
    end
  end

  describe '.generate' do
    it "generates Luhn-compliant number" do
      expect(Luhn.valid?(Luhn.generate)).to be_truthy
    end

    it "generates Luhn-compliant numbers based on length" do
      expect(Luhn.generate(length: 10).length).to eq(10)
    end

    context 'when prefix is provided' do
      it "generates prefixed Luhn-compliant number" do
        num = Luhn.generate(prefix: '143')
        expect(Luhn.valid?(num)).to be_truthy
        expect(num.length).to eq(16)
        expect(num[0..2]).to eq('143')
      end
    end

    context 'when prefix length is greater than number length' do
      it "returns ArgumentError" do
        expect { Luhn.generate(length: 5, prefix: '1434400000') }.to raise_error(ArgumentError)
      end
    end

    context 'when prefix length is equal to number length' do
      it "returns ArgumentError" do
        expect { Luhn.generate(length: 5, prefix: '14344') }.to raise_error(ArgumentError)
      end
    end

    context 'when prefix length + 2 is equal to number length' do
      it "returns ArgumentError" do
        expect { Luhn.generate(length: 7, prefix: '14344') }.to raise_error(ArgumentError)
      end
    end

    it "returns ArgumentError if length is nil" do
      expect { Luhn.generate(length: nil) }.to raise_error(ArgumentError)
    end

    it "returns ArgumentError if length is negative" do
      expect { Luhn.generate(length: -1) }.to raise_error(ArgumentError)
    end

    it "returns ArgumentError if prefix is non-numeric" do
      expect { Luhn.generate(prefix: 'foo') }.to raise_error(ArgumentError)
    end
  end

  describe '.check_digit' do
    it 'calculates check digit' do
      expect(Luhn.check_digit('3852000002323')).to eq(7)
      expect(Luhn.check_digit('1234567890')).to eq(3)
      expect(Luhn.check_digit('1122334455667788')).to eq(8)
    end
  end
end
