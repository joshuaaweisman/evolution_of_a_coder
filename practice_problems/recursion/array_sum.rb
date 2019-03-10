# You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_recursive(array)
    return 0 if array.empty?
    array.first + sum_recur(array[1..-1])
end