# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    final_str = ""
    counter = 1

    str.each_char.with_index do |current_letter, idx|
        next_letter = str[idx + 1]

        if next_letter == current_letter
            counter += 1
        else
            final_str += current_letter if counter == 1
            final_str += "#{counter}#{current_letter}" if counter > 1
            counter = 1
        end
    end
    final_str
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"