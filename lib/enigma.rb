class Enigma
  attr_reader :message, :key, :date, :ALPHA

  ALPHA = ("a".."z").to_a << " "

  def encrypt(message, key, date)
    hash = {}
    hash[:encryption] = "keder ohulw"
    hash[:date] = date
    hash[:key] = key
    hash
  end

  def generator_key
    key = rand(99999).to_s.rjust(5, "0")
  end

  def today_date
    Date.today.strftime("%d%m%y")
    date = Date.today.strftime ("%d%m%y")
  end

  #lets find the keys and the offsets
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
    shift_array = []
    shift_array << key[0].to_i + offset[0]
    shift_array << key[1].to_i + offset[1]
    shift_array << key[2].to_i + offset[2]
    shift_array << key[3].to_i + offset[3]
    shift_array
  end

  def encrypt_message(message, key = generator_key, date = today_date)
    message_chared = message.downcase.chars
    encrypted_array = []
    message_chared.each_with_index do |letter, index|
      if ALPHA.include?(letter) == false
        encrypted_array << letter
      elsif index % 4 == 0
        first_encrypted_letter = ALPHA.rotate(key[0])[ALPHA.index(letter)]
        encrypted_array << first_encrypted_letter
      elsif index % 4 == 1
        second_encrypted_letter = ALPHA.rotate(key[1])[ALPHA.index(letter)]
        encrypted_array << second_encrypted_letter
      elsif index % 4 == 2
        third_encrypted_letter = ALPHA.rotate(key[2])[ALPHA.index(letter)]
        encrypted_array << third_encrypted_letter
      elsif index % 4 == 3
        fourth_encrypted_letter = ALPHA.rotate(key[3])[ALPHA.index(letter)]
        encrypted_array << fourth_encrypted_letter
        end
      end
      encrypted_array.join
    end

    def decrypt_message(message, key, date = today_date)
      message_chared = message.downcase.chars
      decrypted_array = []
      message_chared.each_with_index do |letter, index|
        if ALPHA.include?(letter) == false
          decrypted_array << letter
        elsif index % 4 == 0
          first_decrypted_letter = ALPHA.rotate(key[0] * -1)[ALPHA.index(letter)]
          decrypted_array << first_decrypted_letter
        elsif index % 4 == 1
          second_decrypted_letter = ALPHA.rotate(key[1] * -1)[ALPHA.index(letter)]
          decrypted_array << second_decrypted_letter
        elsif index % 4 == 2
          third_decrypted_letter = ALPHA.rotate(key[2] * -1)[ALPHA.index(letter)]
          decrypted_array << third_decrypted_letter
        elsif index % 4 == 3
          fourth_decrypted_letter = ALPHA.rotate(key[3] * -1)[ALPHA.index(letter)]
          decrypted_array << fourth_decrypted_letter
          require "pry"; binding.pry
          end
        end
        decrypted_array.join
      end
  end
