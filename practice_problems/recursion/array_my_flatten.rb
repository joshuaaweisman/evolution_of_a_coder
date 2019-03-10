 # Takes a multi-dimentional array and returns a single array of all the elements
 # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]

class Array

    def my_flatten
        return [self] if !self.is_a?(Array)

        final_arr = []
        self.each do |el|
            if el.is_a?(Array)
                final_arr += el.my_flatten
            else
                final_arr << el
            end
        end

        final_arr
    end

end