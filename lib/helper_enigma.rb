require 'date'

module HelperEnigma

  def initialize
    @shift_array = []
    @encrypted_message = nil
    @decrypted_message = nil
    @encrypted = nil
    @random_key = nil
  end

  def generator_key
    key = rand(99999).to_s.rjust(5, "0")
  end

  def today_date
    Date.today.strftime("%d%m%y")
    date = Date.today.strftime ("%d%m%y")
  end

  def key_to_keys(key)
    keys_array = []
    keys_array << key[0..1].to_i
    keys_array << key[1..2].to_i
    keys_array << key[2..3].to_i
    keys_array << key[3..4].to_i
    keys_array

  end

  def date_to_offset(date)
    date_integer = date.to_i * date.to_i
    last_four = date_integer.to_s[-4..-1]
    seperated_last_four = last_four.chars
    seperated_last_four.map do |element|
      element.to_i
    end
  end

  def shifts(key, offset)
    key_array = key_to_keys(key)
    @shift_array << key_array[0].to_i + offset[0]
    @shift_array << key_array[1].to_i + offset[1]
    @shift_array << key_array[2].to_i + offset[2]
    @shift_array << key_array[3].to_i + offset[3]
    @shift_array
  end

  def seperated_shifts
     hash = {
       "shift_a" => @shift_array[0],
       "shift_b" => @shift_array[1],
       "shift_c" => @shift_array[2],
       "shift_d" => @shift_array[3]
     }
  end
end
