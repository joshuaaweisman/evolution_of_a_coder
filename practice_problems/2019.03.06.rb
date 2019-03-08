require "byebug"


#####################################################################
# independent methods
#####################################################################
# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.
def deep_dup(arr)
    return arr if !arr.is_a?(Array)

    new_arr = []
    arr.each do |el|
        new_arr << deep_dup(el)
    end

    new_arr
end



# Write a recursive method that returns all of the subsets of an array
def generate_combos(array, target)
    combos = []
    array.each_with_index do |el, idx|
        current_combo = array.dup.insert(idx, target)
        combos << current_combo
    end
    combos << (array.dup << target)
end



#In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.
# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"
def high_and_low(numbers)
    ints = numbers.split(" ").map(&:to_i)
    "#{ints.max} #{ints.min}"
end



# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    i = num_2
    while true
        return i if i % num_1 == 0 && i % num_2 == 0
        i += num_2
    end
end



# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_counts = Hash.new(0)

    str.chars.each_with_index do |char1, idx|
        char2 = str.chars[idx + 1]
        bigram = "#{char1}#{char2}"
        bigram_counts[bigram] += 1
    end

    best_bigram = nil
    best_count = 0
    bigram_counts.each do |key, val|
        if val > best_count
            best_count = val
            best_bigram = key
        end
    end

    best_bigram
end



# Leetcode #200
# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

                                            # grid = [
                                            #     [1, 1, 1, 1, 0],
                                            #     [1, 1, 0, 1, 0],
                                            #     [1, 1, 0, 0, 0],
                                            #     [0, 0, 0, 0, 0]
                                            # ]

                                            # def check_neighbors(current_position, used_positions, grid)
                                            #     row = current_position[0]
                                            #     col = current_position[1]
                                                
                                            #     up_neighbor = (row > 0) ? [row - 1, col] : nil
                                            #     down_neighbor = (row < 3) ? [row + 1, col] : nil
                                            #     left_neighbor = (col > 0) ? [row, col - 1] : nil
                                            #     right_neighbor = (col < 4) ? [row, col + 1] : nil
                                            #     neighbors = [up_neighbor, down_neighbor, left_neighbor, right_neighbor]
                                                
                                            #     neighbors.each do |neighbor|
                                            #         tile = grid[neighbor[0], neighbor[1]]
                                            #         if neighbor != nil && tile == 1 && !used_positions.include?(neighbor)
                                            #             used_positions << neighbor
                                            #             check_neighbors(neighbor)
                                            #         else
                                            #             used_positions << neighbor
                                            #         end
                                            #     end
                                            # end


                                            # def num_islands(grid)
                                            #     count = 0
                                            #     used_positions = []
                                                
                                            #     grid.each_with_index do |row, idxr|
                                            #         grid.each_with_index do |col, idxc|
                                                        
                                            #             current_position = [idxr, idxc]     
                                            #             used_positions << current_position
                                                        
                                            #             if current_position == 1 && !used_positions.include?(current_position)
                                            #                 used_positions += check_neighbors(current_position, used_positions, grid)
                                            #                 count += 1
                                            #             end
                                                    
                                            #         end
                                            #     end
                                                
                                            #     count
                                            # end

#{"pos"=>[1, 4, 7, 11, 13, 16, 18, 20, 22]
#"peaks"=>[20, 14, 12, 18, 9, 7, 11, 10, 6]}

# Write a recursive method that returns all of the permutations of an array
def permutations(array)
    return [[]] if array.length == 0

    previous_stack = permutations(array[0...-1])
    previous_stack += previous_stack.map {|permutation| permutation.dup + [array[-1]]}
end



# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
    return true if key.length == 0

    target_char = key[0]
    string.each_char.with_index do |char, idx|
        if char == target_char
            return string_include_key?(string[idx + 1..-1], key[1..-1])
        end
    end
    false
end



def subsets(array)

    return [array] if array.length == 1

    combos = []
    array.each do |el|
            combos << [el] if !combos.include?([el])
            rest = array.dup.reject {|item| item == el}

            subsets(rest).each do |current_combo|
                combos << current_combo if !combos.include?current_combo
                combos += generate_combos(current_combo, el)
            end
    end

    final_subs = []
    combos.each do |perm|
        final_subs << perm if !final_subs.include?(perm)
    end
    final_subs.sort
end



def titleize(title)
    no_cap_words = ['a', 'and', 'of', 'over', 'the']
    arr = title.split(" ")

    final_title = []
    arr.each do |word|
        first_let = word[0].upcase
        rest = word[1..-1].downcase
        titleized_word = first_let + rest

        unless no_cap_words.include?(titleized_word.downcase) && final_title.length != 0
            final_title += [titleized_word]
        else
            final_title += [word]
        end
    end

    final_title.join(" ")
end



#####################################################################
# array class
#####################################################################
class Array
    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}
        sorted = false

        while !sorted
            sorted = true

            self.each_with_index do |el1, idx1|
                next if idx1 > self.length - 2
                idx2 = idx1 + 1
                el2 = self[idx2]

                if prc.call(el1, el2) > 0
                    self[idx1], self[idx2] = self[idx2], self[idx1]
                    sorted = false
                end
            end
        end

        self
    end




    # Takes a multi-dimentional array and returns a single array of all the elements
    # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
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



    # Write a version of flatten that only flattens n levels of an array.
    # E.g. If you have an array with 3 levels of nested arrays, and run
    # my_flatten(1), you should return an array with 2 levels of nested
    # arrays
    #
    # [1,[2,3],[4]].my_controlled_flatten(1) => [1,2,3,4,[5]]
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



    # my_all
    def my_all?(&prc)
        self.each {|el| return false if prc.call(el) == false}
    end



    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
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



#####################################################################
# hash class
#####################################################################
class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverted = {}
        self.each do |key, val|
            inverted[val] = key
        end
        inverted
    end



    # Write a version of merge. This should NOT modify the original hash
    def my_merge(hash2)
        merged = Hash.new
        self.each {|k, v| merged[k] = v}
        
        hash2.each do |k, v|
            if merged[k] == nil
                merged[k] = v
            else
                merged[k] += v
            end
        end

        merged
    end
end



#####################################################################
# string class
#####################################################################
class String
  
    def symmetric_substrings
        subs = [] 
        idx1 = 0
        while idx1 <= self.length - 2
            idx2 = idx1 + 1
            while idx2 <= self.length - 1
                current_sub = self[idx1..idx2]
                subs << current_sub if current_sub == current_sub.reverse
                idx2 += 1
            end
            idx1 += 1
        end
        subs
    end
  
end



#####################################################################
# speed test
#####################################################################
def test_speed(&prc)
    start = Time.now
    prc.call
    Time.now - start
end
