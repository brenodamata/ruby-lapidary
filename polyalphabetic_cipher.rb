# Polyalphabetic Cipher
def poly_cipher plain, key
	positions = plain.downcase.unpack('C*')
	shift_key = key.downcase.unpack('C*').map { |i| i - 96 }
  pick positions, shift_key
end

def pick positions, key
  shifted_positions = positions.map do |p|
    case p
      when (65..90), (97..122)
        shifted = p + key.first
        key << key.shift
        if (shifted > 90 && shifted < 97) || (shifted > 122) # loop around
          shifted = shifted - 26
        end
        p = shifted
      else
        p
      end
  end
  shifted_positions.pack('C*')
end

def decode_pc code, key
  positions = code.downcase.unpack('C*')
  decode_key = key.downcase.unpack('C*').map { |i| 26 - (i - 96) }
  pick positions, decode_key
end

# 'snake'.split('').each do |k|
#   puts "#{k}: #{k.unpack('C')[0] - 96}"
# end

key = "snake"
crypted = poly_cipher "This is a crypted message: Get to the chopper!", key
puts crypted
puts decode_pc crypted, key
