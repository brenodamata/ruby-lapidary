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

# puts caesar_cipher("This is a crypted message: Get to the chopper!", 11)
# => "Estd td l ncjaepo xpddlrp: Rpe ez esp nszaapc!"

puts "Input string:"
string_to_encrypt = gets.chomp
puts "Shift factor:"
shift_factor = gets.chomp.to_i
puts "Caesar Cipher: #{caesar_cipher(string_to_encrypt, shift_factor)}"
