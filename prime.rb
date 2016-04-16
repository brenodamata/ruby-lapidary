def is_prime? n
  2.upto(Math.sqrt(n).to_i) do |i|
    return false if n%i == 0
  end
  true
end

def get_factor n
  2.upto(n-1) do |i|
    return i if n%i == 0
  end
end

p "Enter number"
num = gets.chomp.to_i

if is_prime? num
  puts "#{num} is a prime number"
else
  puts "#{num} is NOT a prime number, it is divisable by the number #{get_factor num}"
end
