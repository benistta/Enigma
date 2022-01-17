require "./lib/helper_enigma"

class Enigma
  include HelperEnigma

  attr_reader :message, :key, :date, :ALPHA, :shift_array, :encrypted, :encrypted_message, :random_key

  ALPHA = ("a".."z").to_a << " "


   def encrypt_message(message, key = generator_key, date = today_date)
   message_chared = message.downcase.chars
   encrypted_array = []

   shifts(key, date_to_offset(date))
   message_chared.each_with_index do |letter, index|
     letter.downcase!
     if ALPHA.include?(letter) == false
       encrypted_array << letter
     elsif index % 4 == 0
       first_encrypted_letter = ALPHA.rotate(seperated_shifts.values[0])[ALPHA.index(letter)]
       encrypted_array << first_encrypted_letter
     elsif index % 4 == 1
       second_encrypted_letter = ALPHA.rotate(seperated_shifts.values[1])[ALPHA.index(letter)]
       encrypted_array << second_encrypted_letter
     elsif index % 4 == 2
       third_encrypted_letter = ALPHA.rotate(seperated_shifts.values[2])[ALPHA.index(letter)]
       encrypted_array << third_encrypted_letter
     elsif index % 4 == 3
       fourth_encrypted_letter = ALPHA.rotate(seperated_shifts.values[3])[ALPHA.index(letter)]
       encrypted_array << fourth_encrypted_letter

       end
     end
      @encrypted_message = encrypted_array.join
   end

   def encrypt(message, key = generator_key, date = today_date)
    @random_key = key
    encrypt_message(message, key, date)
     @encrypted = {
      encryption: @encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt_message(message, key, date = today_date)
  message_chared = message.downcase.chars
  decrypted_array = []

  shifts(key, date_to_offset(date))
  message_chared.each_with_index do |letter, index|
    if ALPHA.include?(letter) == false
      decrypted_array << letter
    elsif index % 4 == 0
      first_decrypted_letter = ALPHA.rotate(seperated_shifts.values[0] * -1)[ALPHA.index(letter)]
      decrypted_array << first_decrypted_letter
    elsif index % 4 == 1
      second_decrypted_letter = ALPHA.rotate(seperated_shifts.values[1] * -1)[ALPHA.index(letter)]
      decrypted_array << second_decrypted_letter
    elsif index % 4 == 2
      third_decrypted_letter = ALPHA.rotate(seperated_shifts.values[2] * -1)[ALPHA.index(letter)]
      decrypted_array << third_decrypted_letter
    elsif index % 4 == 3
      fourth_decrypted_letter = ALPHA.rotate(seperated_shifts.values[3] * -1)[ALPHA.index(letter)]
      decrypted_array << fourth_decrypted_letter
      end
    end
    @decrypted_message = decrypted_array.join
  end

  def decrypt(message, key, date = today_date)
   decrypt_message(message, key, date)
   decrypted_hash = {
     decryption: @decrypted_message,
     key: key,
     date: date
   }
 end
end
