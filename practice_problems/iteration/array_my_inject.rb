# Monkey patch the Array class and add a my_inject method. If my_inject receives
# no argument, then use the first element of the array as the default accumulator.

class Array

    def my_inject(accumulator = nil)
        debugger
        if accumulator == nil
            accumulator = self[0]
            self[1..-1].each {|el| accumulator += el}
        else
            self[0..-1].each {|el| accumulator += el}
        end

        accumulator  
    end

end