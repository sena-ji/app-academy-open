# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    # part 1:
    def span
        self.max - self.min if self.length > 0
    end

    def average
        self.sum / (self.length * 1.0) if self.length > 0
    end

    def median
        # if an array was empty, this condition would be false
        if self.length.odd?
            mid_length = self.length / 2
            return self.sort[mid_length]
        # now we can check if the array is empty + odd
        elsif self.length > 0
            mid_length = self.length / 2
            return self.sort[mid_length - 1..mid_length].average
        end
    end

    def counts
        hash = Hash.new(0)

        self.each { |elem| hash[elem] += 1 }

        hash
    end

    # part 2:
    def my_count(value)
        count = 0

        self.each { |elem| count += 1 if elem == value }

        count
    end

    def my_index(value)
        self.each_with_index { |elem, idx| return idx if elem == value }

        nil
    end

    def my_uniq
        array = []

        self.each { |elem| array << elem if !(array.include?(elem)) }

        array
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self.length)}

        i = 0
        while i < self.length
            j = 0
            while j < self.length
                new_arr[j][i] = self[i][j]
                j += 1
            end
            i += 1
        end

        # nother method:
        # new_arr = []
        # (0..self.length) each do |row|
        #     new_row = []
        #     (0..self.length) each do |col|
        #         new_row << self[row][col]
        #     end
        #     new_arr << new_row
        # end
        # new_arr

        new_arr
    end
end