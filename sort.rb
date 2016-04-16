# Sort methods
$LOAD_PATH << '.'
require 'msa.rb'
require 'benchmark'

# O(nˆ2)  /  no need to allocate additional memory
def bubble_sort array
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

# O(nlog2n)
def merge_sort array
  return array if array.size <= 1

  middle = array.size/2-1
  sorted_left = merge_sort array[0..middle]
  sorted_right = merge_sort array[middle+1..-1]

  # use merge sort array method created earlier
  return ToMerge.msa sorted_left, sorted_right
end

# O(n) / memory costly (AKA counting sort)
def mark_sort array
  array_max = array.max
  array_min = array.min
  markings = [0] * (array_max - array_min + 1)
  array.each do |a|
    markings[a - array_min] += 1
  end

  res = []
  markings.length.times do |i|
    markings[i].times do
      res << i + array_min;
    end
  end

  res
end

# testing O(n-2)
def sorted? array
  (1..array.size-1).each do |i|
    if array[i] < array[i-1]
      return false
    end
  end
  true
end

list = [6, 4, 2, 14, -1, 10, 44, -20, 0]
sorted_list = merge_sort list
puts sorted_list.join(' ')
# n = 100000000
# list = Array.new(n) { rand(1..99999) }
# mt = Benchmark.measure { merge_sort list }
# kt = Benchmark.measure { mark_sort list }
