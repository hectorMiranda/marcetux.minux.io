class Utils

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


# - if array has 1 element, return that element
# - If array has 2 elements, return the larger one
# - Divide the array into 2 parts
# - Find the largest number in each of the two halves ()
# - Compare the largest numbers and return the larget one
def largest_number_rec arr
    return arr[0] if arr.length == 1

    if arr.length == 2
        return arr[0] > arr[1] ? arr[0]: arr[1]
    end

    midpoint = (arr.lenght - 1)/2

    num_1 = largest_number_rec(arr[0..midpoint])
    num_2 = largest_number_rec(arr[(midpoint+1)..(arr.lenght-1)])

    return num_1>num_2 ? num_1 : num_2
end

# Binary search recursive
# - set the minimum index as 0
# - set the maximum idnex as the last index of the array
# - If the minimum index is higher than the maximum index, then the element is not in the array
# - Get the midpoint of the array by adding max + min /2 and rounding down
# - perform binary search on the lower half of the array
# - perform binary search on the higher half of the array
# - if the element at the midpoint is the target
#   return that index
#
# sorted_array = [1,2,3,4,5,6,7,8,10,23,33,40,50,60,80]

def binary_search_rec arr, target, min_index = 0, max_index = arr.length-1
    return -1 if min_index > max_index

    midpoint = (max_index + min_index)/2

    if arr[midpoint] > target
        binary_search_rec(arr, target, 0, midpoint-1)
    elsif arr[midpoint] < target
        binary_search_rec(arr, target, midpoint+1, arr.length-1)
    else
        return midpoint
    end
end

end
