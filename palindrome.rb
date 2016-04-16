# Palindrome
class String
  def palindrome?
    letters = downcase.scan(/\w/)
    letters == letters.reverse
  end
end

puts "Enter string to find out if it's a palindrome or not"
str = gets.chomp

if str.palindrome?
  puts "#{str} is a palindrome"
else
  puts "#{str} is not a palindrome"
end
