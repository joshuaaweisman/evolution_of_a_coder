# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.

# Examples:

# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]

class String
    def substrings(length = nil)
        subs = []
        self.chars.each_with_index do |char1, idx1|
            self.chars.each_with_index do |char2, idx2|
                next if idx2 < idx1 || idx1 > self.length - 1

                subs << self[idx1..idx2]
            end
        end

        length == nil ? subs : subs.select {|sub| sub.length == length}
    end
end