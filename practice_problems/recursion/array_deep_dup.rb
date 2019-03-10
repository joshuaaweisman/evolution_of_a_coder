# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
    return arr if !arr.is_a?(Array)

    new_arr = []
    arr.each do |el|
        new_arr << deep_dup(el)
    end

    new_arr
end