# You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
    return true if array.length < 2
    return true if array.length == 2 && array[0] <= array[1]
    array[0] > array[1] ? false : sorted?(array[1..-1])
end