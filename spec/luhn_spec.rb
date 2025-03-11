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
      expect(Luhn.generate(10).length).to eq(10)
    end

    it "returns ArgumentError if length is nil" do
      expect { Luhn.generate(nil) }.to raise_error(ArgumentError)
    end

    it "returns ArgumentError if length is negative" do
      expect { Luhn.generate(-1) }.to raise_error(ArgumentError)
    end
  end
end
