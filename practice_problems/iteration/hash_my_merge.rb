# Write a version of merge. This should NOT modify the original hash

class Hash

    def my_merge(hash2)
        merged = Hash.new
        self.each {|k, v| merged[k] = v}
        
        hash2.each do |k, v|
            if merged[k] == nil
                merged[k] = v
            else
                merged[k] += v
            end
        end

        merged
    end
end