# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
    alphabet ||= ('a'..'z').to_a
    final_str = ""
  
    alphabet.each do |alpha_char|
      if str.include?(alpha_char)
        str.count(alpha_char).times do
          final_str += alpha_char
        end
      end
    end
  
    final_str
end