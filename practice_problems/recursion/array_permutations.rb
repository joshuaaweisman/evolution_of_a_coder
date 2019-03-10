# Write a recursive method that returns all of the permutations of an array

def permutations(array)
    return [[]] if array.length == 0

    final_arr = []
    previous_perms = permutations(array[0...-1])
    previous_perms.each do |set|
        (0..set.length).to_a.each {|idx| final_arr << set.dup.insert(idx, array.last)}
    end

    final_arr
end