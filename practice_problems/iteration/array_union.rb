# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

# accepts ANY NUMBER OF ARRAYS
# returns an ARRAY

# iterate through all arrays
    # for each array, iterate through AND SHOVEL element into final array

    def union(*arrays)
        final_els = []
        arrays.each do |arr|
            arr.each {|el| final_els << el}
        end
        final_els
    end
    
    p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
    p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
