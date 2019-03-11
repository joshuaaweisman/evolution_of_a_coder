require "byebug"

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.

def most_frequent_bigram(str)
    bigram_counts = Hash.new(0)
    str.chars.each_with_index do |char1, idx1|
        next if idx1 > str.length - 2

        idx2 = idx1 + 1
        char2 = str[idx2]
        bigram = char1 + char2
        bigram_counts[bigram] += 1
    end

    best_bigram = bigram_counts.inject { |accumulator, (k, v)| v > accumulator[1] ? [k, v] : accumulator}
    best_bigram[0]
end