pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

pry(main)> enigma.encrypt("hello world end", "08304", "291018")
#=>
#   {
#     encryption: "vjqtbeaweqihssi",
#     key: "08304",
#     date: "291018"
#   }

# crack an encryption with a date
pry(main)> enigma.crack("vjqtbeaweqihssi", "291018")
#=>
#   {
#     decryption: "hello world end",
#     date: "291018",
#     key: "08304"
#   }

# crack an encryption (uses today's date)
pry(main)> enigma.crack("vjqtbeaweqihssi")
#=>
#   {
#     decryption: "hello world end",
#     date: # todays date in the format DDMMYY,
#     key: # key used for encryption
#   }
