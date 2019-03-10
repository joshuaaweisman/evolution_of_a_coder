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