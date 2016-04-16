require 'rubygems'
require 'faker'
require 'benchmark'

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean
    sum / size
  end
end

def generate_routing_number
  number = Faker::Number.number(8).to_s
  d = number.split('').map(&:to_i).select { |d| (0..9).include?(d) }
  checksum = (3 * (d[0] + d[3] + d[6])) + (7 * (d[1] + d[4] + d[7])) + (d[2] + d[5])
  if checksum%10 == 0
    d << 0
  else
    d << 10 - checksum%10
  end
  d.join('')
end

def valid_routing_number? routing_number
  d = routing_number.to_s.split('').map(&:to_i).select { |d| (0..9).include?(d) }
  case d.size
    when 9 then
      checksum = ((3 * (d[0] + d[3] + d[6])) +
                  (7 * (d[1] + d[4] + d[7])) +
                       (d[2] + d[5] + d[8])) % 10
      case checksum
        when 0 then true
        else        false
      end
    else false
  end
end
# Teste
rn = generate_routing_number
puts rn
puts valid_routing_number? rn

# ------------------------- BENCHMARKING -------------------------

def bench
  values = [500000]
  result = {}
  # n = 100000
  values.each do |v|
    times = []
    v.times do
      time = Benchmark.measure { generate_routing_number }
      times << time.real
    end
    result[:"#{v}"] = times.sum
  end
  puts result # {:"1000"=>0.02555701103847241, :"10000"=>0.20429742430860642, :"100000"=>2.1171594363913755}
  # puts "Avg = #{times.mean}"
  # puts "Total (#{n} times) = #{times.sum}"
end

bench
# Avg = 2.1413323438173393e-05
# Total (10000 times) = 0.21413323438173393
# Avg = 2.077293188427575e-05
# Total (100000 times) = 2.077293188427575
