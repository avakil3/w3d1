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

end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true



