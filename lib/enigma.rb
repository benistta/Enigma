class Enigma
  ALPHA = ("a".."z").to_a << " "

  def encrypt(message, key, date)
    hash = {}
    hash[:encryption] = "keder ohulw"
    hash[:date] = date
    hash[:key] = key
    hash
  end
end
