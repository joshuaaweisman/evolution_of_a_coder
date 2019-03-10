class Array

    def my_all?(&prc)
        self.each {|el| return false if prc.call(el) == false}
        true
    end

end