# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root_step(num)
    digit1 = num / 10
    digit2 = num % 10
    sum = digit1 + digit2
end

def digital_root(num)
    until num < 10
        num = digital_root_step(num)
    end
    
    num
end