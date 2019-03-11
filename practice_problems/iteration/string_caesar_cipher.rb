# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string is shifted
# the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"

class String
    def caesar_cipher(num)
        alphabet = ('a'..'z').to_a
        updated_string = ""

        self.chars.each_with_index do |current_char|
            alphabet_index = alphabet.index(current_char)
            new_index = (alphabet_index + num) % alphabet.length
            new_char = alphabet[new_index]
            updated_string += new_char
        end

        updated_string
    end
end