# ------------ Exercise 1 ------------ #
# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).
def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    
    n + sum_to(n - 1)
end



# ------------ Exercise 2 ------------ #
# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.
def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array[0] if nums_array.length == 1

    nums_array[-1] + add_numbers(nums_array[0...-1])
end



# ------------ Exercise 3 ------------ #
# Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1

    (n - 1) * gamma_fnc(n - 1)
end



# ------------ Exercise 4 ------------ #
# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.
def ice_cream_shop(flavors, favorite)
    return false if flavors.empty? 
    flavors[0] == favorite ? true : ice_cream_shop(flavors[1..-1], favorite)
end



# ------------ Exercise 5 ------------ #
# Write a function reverse(string) that takes in a string and returns it reversed.
def reverse(string)
    return "" if string == ""
    string[-1] + reverse(string[0...-1])
end