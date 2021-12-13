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
    #     debugger                                                            # [[ 4, 5, 6 ], [ 7, 8, 9 ]]
    #     new_array = Array.new(self.length) { Array.new(arr.length + 1) }    # [[1, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    #     self.each_with_index do |ele, idx1|                                 # idx1 => 0
    #         new_array[idx1][0] = ele                                        # new_array[0][0] = 1
    #         arr.each_with_index do |subarray, idx2|                         # subarray => [4, 5, 6] idx2 => 0
    #             subarray.each_with_index do |ele, idx3|                     # ele => 4, idx3 => 0
    #                 new_array[idx1][idx3] = subarray[idx2] if idx3 != 0     # new_array[0][1] = subarray[0] if idx3 != 0
    #             end
    #         end
    #     end
    #     print new_array
        new_array = Array.new(self.length) { [] }                               # [[], [], []]

        
    end

end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]




