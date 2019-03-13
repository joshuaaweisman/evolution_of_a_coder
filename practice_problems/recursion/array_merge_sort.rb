
class Array

  # Write an Array#merge_sort method; it should not modify the original array.
  
  def merge_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}
    return self if self.length == 1

    split_point = self.length / 2
    left = self[0...split_point].merge_sort(&prc)
    right = self[split_point..-1].merge_sort(&prc)

    merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    if prc.call(left[0], right[0]) == 1
      return right + left
    else
      return left + right
    end
  end

end