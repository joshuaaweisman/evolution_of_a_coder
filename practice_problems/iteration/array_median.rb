# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
    if self.length.even?
        idx1 = (self.length / 2) - 1
        idx2 = (self.length / 2)
        (self.sort[idx1] + self.sort[idx2]) / 2.0
    else
        idx = self.length / 2
        return self.sort[idx]
    end
  end
end
