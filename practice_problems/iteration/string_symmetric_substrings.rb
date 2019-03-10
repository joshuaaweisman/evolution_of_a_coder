class String
  
    def symmetric_substrings
        subs = [] 
        idx1 = 0
        while idx1 <= self.length - 2
            idx2 = idx1 + 1
            while idx2 <= self.length - 1
                current_sub = self[idx1..idx2]
                subs << current_sub if current_sub == current_sub.reverse
                idx2 += 1
            end
            idx1 += 1
        end
        subs
    end
  
end