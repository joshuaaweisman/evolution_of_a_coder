require "byebug"

def valid_parentheses(string)
    string = string.split("()").join
    string.length == 0
end