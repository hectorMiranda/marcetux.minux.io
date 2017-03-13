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




# Bubble sort
# - Starting at index 0, set index_1 to 0, and index_2 to 1
# - Compare index_1 and index_2 and swap them if need be
# - increment index_1 and index_2 and repeat comparision and swapping
#   until index_2 is the last index in the array
# - After one swoop, the last item in the array is sorted. Set the
#   final index to the second last item, and repeat the swapping
#   process
# - if there is no swap in an iteration, then the list is sorted
def bubble_sort arr
    for i in (0..arr.length-1)
        index_1 = 0
        index_2 = 1

        index_final = (arr.length-1)-i

        swapped = false

        while index_2 <= index_final
            if arr[index_1] > arr[index_2]
                arr[index_2], arr[index_1] = arr[index_1], arr[index_2]
                swapped = true
            end

            index_1 += 1
            index_2 += 1
        end

        return arr if !swapped
    end
    return arr
end


# Swoop through the array and look for the smallest number
# Swap the smallest number with the number at index 0
# Repeat, and swap the second smallest number with the number
# at index 1
# Repeat until you have reached the end of the array

def selection_sort arr
  # var to store the current index
  current_index = 0

  # loop until the end of the array
  while current_index < arr.length

    # assume current number is smallest
    smallest_number_index = current_index

    # loop the array to the right of the number
    for i in ((current_index + 1)..(arr.length - 1))
      # keep track of the smallest number so far
      smallest_number_index = i if arr[i] < arr[smallest_number_index]
    end

    # swap smallest number with current index
    arr[current_index], arr[smallest_number_index] = arr[smallest_number_index], arr[current_index]

    # increment current index
    current_index += 1
  end

  return arr
end



# - if list length is 1, return the list
# - Split the array into two
# - sort the left half of the array (recursively)
# - sort the right half of the array (recursively)
# - Put them back in the correct order
def merge_sort arr
  # base case
  return arr if arr.length == 1

  # split array and sort the halves
  midpoint = (arr.length - 1)/2
  arr_1 = merge_sort(arr[0..midpoint])
  arr_2 = merge_sort(arr[(midpoint + 1)..(arr.length - 1)])

  # put halves back together in the correct order
  return merge(arr_1, arr_2)
end

def merge arr_1, arr_2
  # arr to hold merged array
  arr = []

  # repeatedly compare the lowest elements in the
  # sub arrays and merge them into arr
  while arr_1[0] && arr_2[0]
    if arr_1[0] < arr_2[0]
      arr << arr_1.shift
    else
      arr << arr_2.shift
    end
  end

  # merge the remaining parts of the arrays if elements
  # are still present
  arr.push(arr_1).flatten! if arr_1[0]
  arr.push(arr_2).flatten! if arr_2[0]
  
  return arr
end



def quicksort(ary)
  size = ary.count
  return ary if size <= 1
  i, j = 0, size - 1
  pivot = ary[(size / 2)]
  while i < j
    i += 1 while ary[i] < pivot
    j -= 1 while ary[j] > pivot
    ary[i], ary[j] = ary[j], ary[i]
  end
  quicksort(ary[0..j-1]) + quicksort(ary[j..size-1])
end



end


class Queue
  attr_accessor :arr

  def initialize arr = []
    @arr = arr
  end

  def enqueue num
    @arr << num
  end

  def dequeue
    @arr.shift
  end

  def empty?
    @arr.empty?
  end

  def head
    @arr[0]
  end

  def tail
    @arr[-1]
  end

  def to_s
    @arr.to_s
  end

  def clear!
    @arr = []
  end
end