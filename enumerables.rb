require "byebug"
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

    def my_zip(*arr)   
        new_array = Array.new(self.length) { [] }                               
        (0...self.length).each do |idx| 
            new_array[idx] << self[idx]
            arr.each do |subarray|
                new_array[idx] << subarray[idx]
            end
        end

        p new_array
    end

    def my_rotate(num=1)
        new_array = self.dup
        if num > 0
            num.times { new_array.push(new_array.shift)   }
        else
            (-num).times { new_array.unshift(new_array.pop)   }
        end
        new_array
    end


end




