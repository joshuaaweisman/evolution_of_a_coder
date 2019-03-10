# E.g. If you have an array with 3 levels of nested arrays, and run
# my_flatten(1), you should return an array with 2 levels of nested
# arrays
#
# [1,[2,3],[4]].my_controlled_flatten(1) => [1,2,3,4,[5]]
# Write a version of flatten that only flattens n levels of an array.

class Array

    def flatten_once
        final_arr = []
        self.each do |el|
            el.is_a?(Array) ? final_arr += el : final_arr << el
        end
        final_arr
    end
    
    def my_controlled_flatten(n)
        new_arr = self
        n.times do
            new_arr = new_arr.flatten_once
        end
        new_arr
    end

end