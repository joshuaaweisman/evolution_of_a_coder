# You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def num_occur(array, target)
    count = 0
    return count if array.empty?
    
    count += 1 if array[0] == target
    count + num_occur(array[1..-1], target)
end