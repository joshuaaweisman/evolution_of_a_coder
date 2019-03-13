class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new
    self.each_with_index do |el, idx|
        if hash[el] == nil
            hash[el] = [idx]
        else
            hash[el] << idx
        end
    end
    hash.select {|k, v| hash[k].length > 1}
  end
  
end
