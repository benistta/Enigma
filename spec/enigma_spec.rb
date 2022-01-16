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

  it 'generates random number' do
    enigma = Enigma.new
    expect(enigma.generator_key.length).to eq(5)
  end

  it 'generates today date' do
    enigma = Enigma.new
    expect(enigma.today_date).to eq("150122")
  end

  it 'it can get keys from key' do
    enigma = Enigma.new
    expect(enigma.key_to_keys("02715")).to eq([2, 27, 71, 15])
  end

  it 'it can get offsets from date' do
    enigma = Enigma.new
    expect(enigma.date_to_offset("040895")).to eq([1, 0, 2, 5])
  end

  it 'getting shifts' do
    enigma = Enigma.new
    expect(enigma.shifts([2, 27, 71, 15], [1, 0, 2, 5])).to eq([3, 27, 73, 20])
  end



  xit 'takes message encrypts the message' do
    enigma = Enigma.new
    expect(enigma.encrypt_message("hello world", [3, 27, 73, 20])).to eq("keder ohulw")
  end
end
