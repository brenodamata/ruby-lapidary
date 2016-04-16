# Merging two sorted arrays
module ToMerge
  def self.msa array1, array2
    msa = []

    loop do
      break if array1.empty? || array2.empty?
      msa << (array1[0] < array2[0] ? array1.shift : array2.shift)
    end

    msa + array1 + array2
  end
end

a = [1,3,7,11] # | 3,7,11   | 3,7,11 | 7,11   | 7,11    | 7,11      | 11          | empty
b = [2,4,6,14] # | 2,4,6,14 | 4,6,14 | 4,6,14 | 6,14    | 14        | 14          | 14
# c = empty      | 1        | 1,2    | 1,2,3  | 1,2,3,4 | 1,2,3,4,6 | 1,2,3,4,6,7 | 1,2,3,4,6,7,11

c = ToMerge.msa a,b
puts c.join(' ')
