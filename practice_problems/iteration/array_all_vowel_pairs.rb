# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

def all_vowel_pairs(words)
    vowels = %w(a e i o u)
    best_pairs = []

    words.each_with_index do |word1, idx1|
        words.each_with_index do |word2, idx2|
            next if idx2 < idx1 || idx1 > words.length - 2

            current_pair = "#{word1} #{word2}"
            best_pairs << current_pair if vowels.all? {|vowel| current_pair.include? vowel}
        end
    end

    best_pairs
end