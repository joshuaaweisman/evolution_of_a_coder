# You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
    return false if array.length < 2

    first = array[0]
    second = array[1]
    array[0] + array[1] == 12 ? true : add_to_twelve?(array[1..-1])
end