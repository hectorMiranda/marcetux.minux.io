class Utils
def info 
    puts "np"
end

def largest_number arr
    largest_number = 0

    arr.each do |i|
        largest_number = i if i > largest_number
    end
    return largest_number
end


# * List must be sorted
# - Set the minimum index as 0
# - Set the maximum index as the last index of the array
# X - Get the midpoint of the array by adding max + min /2, rounding down
# - Get the midpoint of the array
# - If element at midpoint is bigger,
#     set the maximum index to the midpoint - 1 and repeat from step X
#     
# - If element at midpoint is smaller
#     set the minimum index to the midpoint + 1 and repeat from step X
#- If the element at midpoint is the target 
#- If the minimum index is higher than the maximum index, then the element is not in the array
#      return that index
def binary_search arr, target
    min_index = 0
    max_index = arr.length-1

    while min_index <= max_index
        midpoint = (max_index + min_index)/2

        if arr[midpoint] > target
            max_index = midpoint - 1
        elsif arr[midpoint] < target
            min_index = midpoint + 1
        else
            return arr[midpoint]
        end
    end

    return -1
end


end