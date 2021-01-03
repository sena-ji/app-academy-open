# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths.
def sluggish_octopus(fish_array)
  longest_fish = ""

  fish_array.each_index do |idx1|
    (idx1+1...fish_array.length).each do |idx2|
      if fish_array[idx1].length < fish_array[idx2].length
        longest_fish = fish_array[idx2]
      else
        longest_fish = fish_array[idx1]
      end
    end
  end

  longest_fish
end