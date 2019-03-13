# Write a method that returns the factors of a number in ascending order.

def factors(num)
    arr = []
    1.upto(num).each do |factor|
        arr << factor if num % factor == 0
    end
    arr
end
