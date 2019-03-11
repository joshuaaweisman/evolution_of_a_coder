# Write a method, Array#bubble_sort, that takes in an optional proc argument.
# When given a proc, the method should sort the array according to the proc.
# When no proc is given, the method should sort the array in increasing order.
   
class Array
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}
        sorted = false

        while !sorted
            sorted = true

            self.each_with_index do |el1, idx1|
                next if idx1 > self.length - 2
                idx2 = idx1 + 1
                el2 = self[idx2]

                if prc.call(el1, el2) > 0
                    self[idx1], self[idx2] = self[idx2], self[idx1]
                    sorted = false
                end
            end
        end

        self
    end
end