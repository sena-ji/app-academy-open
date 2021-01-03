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

# Find the longest fish in O(n log n) time. Hint: Use merge sort.
def dominant_octopus(fish_array)
  sorted_fishes = merge_sort_fishes(fish_array)

  sorted_fishes.last
end

def merge_sort_fishes(fish_array)
  return fish_array if fish_array.length <= 1

  mid_fish = fish_array.length / 2
  left_fishes_sorted = fish_array.take(fish_array.length/2)
  right_fishes_sorted = fish_array.drop(fish_array.length/2)

  merge_fishes(left_fishes_sorted, right_fishes_sorted)
end

def merge_fishes(left, right)
  new_array = []
  left_idx, right_idx = 0, 0

  while left_idx < left.length && right_idx < right.length
    case left[left_idx] <=> right[right_idx]
    when -1
      new_array << left[left_idx]
      left_idx += 1
    when 0
      new_array << left[left_idx]
      left_idx += 1
    when 1
      new_array << right[right_idx]
      right_idx += 1
    end
  end

  while left_idx < left.length
    new_array << left[left_idx]
    left_idx += 1
  end

  while right_idx < right.length
    new_array << right[right_idx]
    right_idx += 1
  end

  new_array
end

# Find the longest fish in O(n) time. The octopus can hold on to the longest fish while stepping through the array only once.
def clever_octopus(fish_array)
  longest_fish = fish_array.first

  fish_array.each do |fish|
    longest_fish = fish if longest_fish.length < fish.length
  end

  longest_fish
end