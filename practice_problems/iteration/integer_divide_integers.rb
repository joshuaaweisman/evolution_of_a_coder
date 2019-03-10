# Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.
# Return the quotient after dividing divident by divisor.

def divide_integers(dividend, divisor)
    return 1 if dividend == divisor
    
    quotient = 0
    counter = divisor.abs
    until dividend.abs < counter
        quotient += 1
        counter += divisor.abs
    end

    if dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
        quotient
    else
        quotient * -1
    end
end