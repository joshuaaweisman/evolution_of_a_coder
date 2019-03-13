# return the sum of the first n even numbers recursively. Assume n > 0
def first_even_numbers_sum(n)
    return 2 if n == 1
    first_even_numbers_sum(n - 1) + 2n
end


