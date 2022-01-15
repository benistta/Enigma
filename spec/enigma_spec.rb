require 'date' # use Date.today
require './lib/enigma'


RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_instance_of(Enigma)
  end

  it 'encrypted message' do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'it can get keys from key' do
    enigma = Enigma.new
    expect(enigma.key_to_keys("02715")).to eq([2, 27, 71, 15])
  end

  it 'it can get offsets from date' do
    enigma = Enigma.new
    expect(enigma.date_to_offset("040895")).to eq([1, 0, 2, 5])
  end
end
