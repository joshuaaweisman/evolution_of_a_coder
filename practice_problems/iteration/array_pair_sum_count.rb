# Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target


class Array

    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num1, idx|
            self[idx + 1..-1].each do |num2|
                count += 1 if num1 + num2 == num
            end
        end
        count
    end

end