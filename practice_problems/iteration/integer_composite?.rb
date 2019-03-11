# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false

def composite?(num)
    (2...num).each {|i| return true if num % i == 0}
    false
end