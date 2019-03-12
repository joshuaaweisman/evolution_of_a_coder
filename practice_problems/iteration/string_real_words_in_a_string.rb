# Returns an array of all the subwords of the string that appear in the
# dictionary argument. The method does NOT return any duplicates.

class String
  
    def real_words_in_string(dictionary)
      final_words = []
  
      self.chars.each_with_index do |char1, idx1|
        self.chars.each_with_index do |char2, idx2|
          next if idx2 < idx1
  
          subword = self[idx1..idx2]
          final_words << subword if dictionary.include?(subword)
        end
      end
  
      final_words.uniq
    end

end