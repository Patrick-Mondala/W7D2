# Execution Time Difference
# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved
# my_min
# Given a list of integers find the smallest number in the list.

# Example:

    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. 
#Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
def my_minI(list)
    smallest = list.first 
    list.each do |num1|
        list.each do |num2|
            smallest = num1 if num1 < num2 && num1 < smallest 
        end
    end
    smallest 
end # time O(n^2) 
    # space O(1)



# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
def my_minII(list)
    list.inject { |smallest, current| current < smallest ? current : smallest }
end #time O(n)
    #space O(1)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
#First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.
def largest_contiguous_subsum(list)
    sub_sums = []
    (0...list.length).each do |idx1|
        (idx1...list.length).each do |idx2|
            sub_sums << list[idx1..idx2].sum  
        end
    end
    sub_sums
end # time O(n^2)
    # space O(n^2)
    # (n(n - 1))/2
# p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.

def largest_contiguous_subsumII(arr)
    largest = arr.first
    current_sum = 0
    arr.each do |num|
        current_sum += num 
        if current_sum <= 0
            current_sum = 0
        end

        if current_sum > largest
            largest = current_sum
        end
    end
    largest
end

p largest_contiguous_subsumII([2, 3, -6, 7, -6, 7])

# Get your story straight, and then explain your solution's time complexity to your TA.