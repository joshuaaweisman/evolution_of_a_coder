# Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped

class Hash

    def inverse
        inverted = {}
        self.each do |key, val|
            inverted[val] = key
        end
        inverted
    end

end