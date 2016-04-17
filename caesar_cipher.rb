def caesar_cipher input, shift
	positions = input.unpack('C*')
	shifted_positions = positions.map do |p|
		case p
			when (65..90), (97..122)
				shifted = p + (shift % 26)
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

def frequency input
  counts = {}

  input.each_char do |char|
    next if char == " "
    counts[char] = 0 unless counts.include?(char)
    counts[char] += 1
  end
  counts
end

# 101 is 'e' the most frequent letter in the english language
# after descoverying the most frequent letter in the crypted message
# we can apply this rule to find out the shift used to crypt the original message
# knowing the original shift we can make a new shift to decrypt it (26 - original shift)
def decode_shift char
  26 - (char.unpack('C*')[0] - 101)
end

def decode_cipher input
  # Get most frequent letter in the crypted message
  key = frequency(input).sort_by { |letter,frequency| frequency }.reverse.first[0]
  dshift = decode_shift key

  caesar_cipher input, dshift
end

# puts caesar_cipher("This is a crypted message: Get to the chopper!", 12)

# Decoding without knowing the shift
puts decode_cipher "gvjd nl o dcdihfo rxgtllx: Ufe yh hip hacqajk!".downcase

# puts "Input string:"
# string_to_encrypt = gets.chomp
# puts "Shift factor:"
# shift_factor = gets.chomp.to_i
# puts "#{caesar_cipher(string_to_encrypt, shift_factor)}"
