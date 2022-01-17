require './lib/enigma'

enigma = Enigma.new
key = ARGV[2]
date = ARGV[3]

decryption = enigma.decrypt(File.read(ARGV[0]), key, date)

File.open(ARGV[1], "w") do |file|

  file.puts decryption[:decryption]
  puts "Created #{ARGV[1]} with the key #{decryption[:key]} and date #{decryption[:date]}"
end
