# Write a recursive method that returns all subsets of an array

def subsets(array)
    return [[]] if array.empty?
    previous_subset = subsets(array[0...-1])    
    previous_subset + previous_subset.map {|set| set += [array.last]}
end