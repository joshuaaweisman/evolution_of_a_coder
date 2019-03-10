# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false

def string_include_key?(string, key)
    return true if key == ""
    string.each_char.with_index do |char, idx|
        if char == key[0]
            return string_include_key(string[(idx + 1)..-1], key[1..-1])
        end
    end

    false
end