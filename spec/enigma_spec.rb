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
    expect(enigma.today_date).to eq("160122")
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
    expect(enigma.shifts("02715", [1, 0, 2, 5])).to eq([3, 27, 73, 20])
  end

  it 'seperates shifts' do
    enigma = Enigma.new
    enigma.shifts("02715", [1, 0, 2, 5])
    expect(enigma.seperated_shifts).to eq({
      "shift_a" => 3,
      "shift_b" => 27,
      "shift_c" => 73,
      "shift_d" => 20
    })
  end

  it 'takes message encrypts the message' do
    enigma = Enigma.new
    expect(enigma.encrypt_message("hello world", "02715", "040895")).to eq("keder ohulw")
  end

  it 'takes message encrypts the message and return a hash with date and key' do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'takes message decrypts the message' do
    enigma = Enigma.new
    expect(enigma.decrypt_message("keder ohulw", "02715", "040895")).to eq("hello world")
  end

end
