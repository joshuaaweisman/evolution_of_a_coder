require "byebug"


#####################################################################
# independent methods
#####################################################################
# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
    return [1] if num == 1
    factorials_rec(num - 1) << factorials_rec(num - 1).last * (num - 1)
end



# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.
# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?
# The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m if such a n exists or -1 if there is no such n.
# findNb(1071225) --> 45
# findNb(91716553919377) --> -1
def cube_volume(levels)
    return 1 if levels == 1
    levels**3 + cube_volume(levels - 1)
end


def find_nb(m)
    num_of_levels = Math.sqrt(m)
    while true
        volume = cube_volume(num_of_levels)
        return num_of_levels if volume == m
        return -1 if volume > m
        num_of_levels += 1
    end
end



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



# Write a recursive method that places a target value before, between, and after every element of an array
def generate_combos(array, target)
    combos = []
    array.each_with_index do |el, idx|
        current_combo = array.dup.insert(idx, target)
        combos << current_combo
    end
    combos << (array.dup << target)
end



# Write a recursive method that returns all subsets of an array
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



# subsets v2
def subsets_v2(array)
    return [[]] if array.empty?
    previous_subset = subsets_v2(array[0...-1])    
    previous_subset + previous_subset.map {|set| set += [array.last]}
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

    final_arr = []
    previous_perms = permutations(array[0...-1])
    previous_perms.each do |set|
        (0..set.length).to_a.each {|idx| final_arr << set.dup.insert(idx, array.last)}
    end

    final_arr
end





# You have array of integers. Write a recursive solution to find the sum of the integers.
def sum_recur(array)
    return 0 if array.empty?
    array.first + sum_recur(array[1..-1])
end



# In "Practical Ruby Projects," the author includes a couple of chapters involving coin simulations. These simulators are used to explore the possibilities of replacing a certain coin or adding a new coin.
# One interesting subproblem of these simulations is that of making change. For example, if we need to give 39 cents change in the United States (where there are 25, 10, 5, and 1 cent pieces), we can give:
# ruby
#     >> make_change(39)
#     => [25, 10, 1, 1, 1, 1]
def make_change(change_needed, cash_register)
    return [] if change_needed == 0
    
    pile_of_coins = []
    biggest_coin = cash_register[0]
    remaining_balance = change_needed

    until remaining_balance == 0
        remaining_balance = change_needed - pile_of_coins.sum

        if remaining_balance >= biggest_coin
            pile_of_coins << biggest_coin
        else
            pile_of_coins += make_change(remaining_balance, cash_register[1..-1])
        end
    end

    pile_of_coins
end



# make better change
def make_better_change(change_needed, coins)
    options = []
    return options if change_needed == 0

    coins.each do |current_coin|
        if current_coin <= change_needed
            balance = change_needed - current_coin
            possibility = [current_coin] + make_better_change(balance, coins)
            options << possibility if possibility.length > 0
        end
    end

    options.sort_by!(&:length)
    options[0]
end



# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key(string, key)
    return true if key == ""
    string.each_char.with_index do |char, idx|
        if char == key[0]
            return string_include_key(string[(idx + 1)..-1], key[1..-1])
        end
    end

    false
end



def includes?(array, target)
    return false if array.empty?
    array[0] == target ? true : includes?(array[1..-1], target)

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



def num_occur(array, target)
    count = 0
    return count if array.empty?
    
    count += 1 if array[0] == target
    count + num_occur(array[1..-1], target)
end



# Sudoku Solution Validator
# Write a function validSolution/ValidateSolution/valid_solution() that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0's, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.
# The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.
# Examples
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 5, 3, 4, 8],
#   [1, 9, 8, 3, 4, 2, 5, 6, 7],
#   [8, 5, 9, 7, 6, 1, 4, 2, 3],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 6, 1, 5, 3, 7, 2, 8, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 4, 5, 2, 8, 6, 1, 7, 9]
# ]); // => true
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2], 
#   [6, 7, 2, 1, 9, 0, 3, 4, 8],
#   [1, 0, 0, 3, 4, 2, 5, 6, 0],
#   [8, 5, 9, 7, 6, 1, 0, 2, 0],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 0, 1, 5, 3, 7, 2, 1, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 0, 0, 4, 8, 1, 1, 7, 9]
# ]); // => false
def rotate(board)
    new_board = Array.new(9) {[]}

    i = 0
    while i < board.length
        board.each {|row| new_board[i] << row[i]}
        i += 1
    end

    new_board
end


def find_squares(grid)
    square_01 = grid[0][0..2] + grid[1][0..2] + grid[2][0..2]
    square_02 = grid[0][3..5] + grid[1][3..5] + grid[2][3..5]
    square_03 = grid[0][6..8] + grid[1][6..8] + grid[2][6..8]
    square_04 = grid[3][0..2] + grid[4][0..2] + grid[5][0..2]
    square_05 = grid[3][3..5] + grid[4][3..5] + grid[5][3..5]
    square_06 = grid[3][6..8] + grid[4][6..8] + grid[5][6..8]
    square_07 = grid[6][0..2] + grid[7][0..2] + grid[8][0..2]
    square_08 = grid[6][3..5] + grid[7][3..5] + grid[8][3..5]
    square_09 = grid[6][6..8] + grid[7][6..8] + grid[8][6..8]
    return [square_01, square_02, square_03, square_04, square_05, square_06, square_07, square_08]
end


def check_row(board)
    used_tiles = []
    board.each do |row|
        row.each do |tile|
            return false if tile == 0 || used_tiles.include?(tile)
            used_tiles << tile
        end
        used_tiles = []
    end
    true
end


def check_column(board)
    flipped_board = rotate(board)
    check_row(flipped_board)
end


def check_squares(board)
    squares_board = find_squares(board)
    check_row(squares_board)
end


def valid_solution(board)
    return false if board.any? {|row| row.include?(0)}
    return false unless check_row(board)
    return false unless check_column(board)
    return false unless check_squares(board)
    true
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



    # Monkey patch the Array class and add a my_inject method. If my_inject receives
    # no argument, then use the first element of the array as the default accumulator.
    def my_inject(accumulator = nil)
        debugger
        if accumulator == nil
            accumulator = self[0]
            self[1..-1].each {|el| accumulator += el}
        else
            self[0..-1].each {|el| accumulator += el}
        end

        accumulator  
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
