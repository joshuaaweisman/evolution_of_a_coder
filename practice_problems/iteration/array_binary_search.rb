# Write a monkey patch of binary search:
# E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4

class Array
  
  def my_bsearch(target, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    mid_idx = self.length / 2
    current_num = self[mid_idx]

    return mid_idx if prc.call(current_num, target) == 0

    left = self[0...mid_idx]
    right = self[mid_idx..-1]
    if prc.call(current_num, target) < 0
      return left.length + right.my_bsearch(target, &prc)
    elsif prc.call(current_num, target) > 0
      return left.my_bsearch(target, &prc)
    end
  end

end
