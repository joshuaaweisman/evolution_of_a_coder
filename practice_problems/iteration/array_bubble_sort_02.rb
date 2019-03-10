# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
    sorted = false

    while !sorted
        sorted = true

        arr.each_with_index do |num1, idx1|
            arr.each_with_index do |num2, idx2|
                next if idx2 <= idx1 || idx2 > arr.length - 1

                if num1 > num2
                    arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
                    sorted = false
                end
            end
        end
    end

    arr
end


p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]