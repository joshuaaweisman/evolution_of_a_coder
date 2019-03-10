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