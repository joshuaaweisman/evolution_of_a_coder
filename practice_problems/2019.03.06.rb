require "byebug"


#####################################################################
# independent methods
#####################################################################
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



# Write a recursive method that returns all of the subsets of an array
def generate_combos(array, target)
    combos = []
    array.each_with_index do |el, idx|
        current_combo = array.dup.insert(idx, target)
        combos << current_combo
    end
    combos << (array.dup << target)
end



# Write a recursive method that returns all of the permutations of an array
def permutations(array)
    return [[]] if array.length == 0

    previous_stack = permutations(array[0...-1])
    previous_stack += previous_stack.map {|permutation| permutation.dup + [array[-1]]}
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



    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)  
        prc ||= Proc.new {|a, b| a <=> b}

        sorted = false
        while sorted == false
            sorted = true
            self.each_with_index do |num1, idx|
                next if idx == self.length - 1
                num2 = self[idx + 1]

                if prc.call(num1, num2) == 1
                    self[idx], self[idx + 1] = self[idx + 1], self[idx]
                    sorted = false
                end
            end
        end

        self
    end



    # my_all
    def my_all?(&prc)
        self.each {|el| return false if prc.call(el) == false}
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
