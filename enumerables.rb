class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []

        i = 0
        while i < self.length
            new_array << self[i] if prc.call(self[i])
            i += 1
        end

        new_array
    end

    def my_reject(&prc)
        self.select {|ele| !prc.call(ele) }
    end

    def my_any?(&prc)
        self.each { |ele| return true if prc.call(ele) }
        return false
    end

    def my_all?(&prc)
        self.each { |ele| return false if !prc.call(ele) }
        return true
    end

    def my_flatten
        flattened = []
        self.each do |ele| 
            if ele.is_a?(Array)
            flattened += ele.my_flatten
            else
                flattened << ele
            end    
        end
        flattened
    end

end





