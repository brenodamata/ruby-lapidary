# Reverse an array in place - the reverse method
def swap arry, ia, ib
  temp = arry[ia]
  arry[ia] = arry[ib]
  arry[ib] = temp
  arry
end

def reverse_array arry
  for i in 0..(arry.size/2)-1
    arry = swap arry,i,arry.size-1-i
  end
  arry
end

# list = [6, 4, 2, 14]
list = ["front","ruby","the","in","good","all","far","so",":",3,"number","test","is","this"]
new_arr = reverse_array list
puts new_arr.join(' ')
