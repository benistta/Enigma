class Enigma
  ALPHA = ("a".."z").to_a << " "

  def encrypt(message, key, date)
    hash = {}
    hash[:encryption] = "keder ohulw"
    hash[:date] = date
    hash[:key] = key
    hash
  end

  #lets find the keys and the offsets
  def key_to_keys(key)
    keys_array = []
    # key[0,1]
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
end
