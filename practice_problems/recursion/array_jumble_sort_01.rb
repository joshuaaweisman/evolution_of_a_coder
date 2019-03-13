# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
def count_letter_occurrences(str, letter)
    count = 0
    str.chars.each do |char|
        count += 1 if char == letter
    end
    count
end


def jumble_sort(str, alphabet = nil)   
    alphabet ||= 'abcdefghijklmnopqrstuvwxyz'.chars
    sorted_str = ""

    alphabet.each do |char|
        frequency = count_letter_occurrences(str, char)
        frequency.times { sorted_str << char }
    end

    sorted_str
end