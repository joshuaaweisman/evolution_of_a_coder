# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers

def least_common_multiple(num_1, num_2)
    i = num_2
    while true
        return i if i % num_1 == 0 && i % num_2 == 0
        i += num_2
    end
end