# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
#
# Solve this recursively!
#
# Examples:
#
# pow(2, 0) # => 1
# pow(2, 1) # => 2
# pow(2, 5) # => 32
# pow(3, 4) # => 81
# pow(4, 3) # => 64

def pow(base, exponent)
    return 1 if exponent == 0
    base * pow(base, exponent - 1)
end