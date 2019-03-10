def includes?(array, target)
    return false if array.empty?
    array[0] == target ? true : includes?(array[1..-1], target)
end