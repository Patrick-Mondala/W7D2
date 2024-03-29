require "set"

# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false
# Learning Goals
# Be able to reason about a difficult problem and think of ways to solve it.
# Be able to determine and explain the time and space complexity of a method
# Be able to recognize when time or space complexity can be improved
# Know some common tricks to improve time or space complexity
# Before you start coding anything, talk it over with your partner. Sketch out on paper how you'd approach this problem. 
# What would be the running time of your proposed solution? Take as long as you need, but don't write any code yet.

# Brute force
# If we weren't worried about time complexity, what would be the most straightforward way to solve this problem? 
# To start with, we could check every possible pair. If we sum each element with every other, we're sure to either 
# find the pair that sums to the target, or determine that no such pair exists.

# def bad_two_sum?(arr, target_sum)
#     arr.each_with_index do |el1, idx1|
#         arr.each_with_index do |el2, idx2|
#             return true if idx2 > idx1 && el1 + el2 == target_sum
#         end
#     end
#     false
# end

# arr = [0, 1, 5, 7]
#p bad_two_sum?(arr, 6) # => should be true
#p bad_two_sum?(arr, 10) # => should be false

# This is the brute force solution. It's essentially hitting the problem with a sledge hammer. 
# There are faster and more elegant ways to solve the problem, but we know for sure that this will get the job done.

# Let's start by implementing the brute force solution. Write a method called bad_two_sum?, which checks every possible pair.

# Make sure that you don't pair an element with itself. However, you don't need to bother checking for summing the same pair twice; that won't affect your result.

# (Note: you can cut the running-time significantly by returning early, and by not checking pairs 
# more than once. However, these micro-optimizations will not improve the time complexity of the solution. Do you see why?)

# Once you're done, write a comment with your solution's time complexity.
# time O(n^2)
# space O(1)

# Sorting
# As a person of elevated algorithmic sensibilities, the brute-force approach is beneath you. Leave that nonsense to the riffraff.
# Instead, you'll apply a refined and time-honored technique: sorting.

# Sort your data, then try to solve the problem.

# def okay_two_sum?(arr, target_sum)
#     arr.sort!
#     new_arr = arr.dup 

#     new_arr.each do |ele|
#         current_ele = new_arr.shift 
#         target_ele = target_sum - current_ele 
#         return true if bsearch(new_arr, target_ele)
#     end
#     false
# end

# def bsearch(arr, target)
#     midpoint = arr.length / 2 

#     return false if arr[midpoint].nil?    
#     left = arr[0...midpoint]
#     right = arr[midpoint + 1..-1]

#     case target <=> arr[midpoint]
#     when -1
#         return bsearch(left, target)
#     when 0
#         return true 
#     when 1
#         return bsearch(right, target) 
#     end
#     false
# end
 
# okay_two_sum?(arr, 6) #=> true
# okay_two_sum?(arr, 10) #=> false

# What does sorting do to the lower bound of your time complexity?
# How might sorting that make the problem easier?
# Write a second solution, called okay_two_sum?, which uses sorting. Make sure it works correctly.

# Hint: (There are a couple ways to solve this problem once it's sorted. One way involves using a 
# very cheap algorithm that can only be used on sorted data sets. What are some such algorithms you know?)

# Hash Map
# Finally, it's time to bust out the big guns: a hash map. Remember, a hash map has O(1) #set and O(1) #get, 
# so you can build a hash out of each of the n elements in your array in O(n) time. That hash map prevents you 
# from having to repeatedly find values in the array; now you can just look them up instantly.
def great_two_sum?(arr, target_sum)
    numbers = Hash.new
    arr.each_with_index do |num, i|
    end

    arr.each_with_index do |ele, i2|
        target = target_sum - ele 
        return true if numbers[target] 
    end
    false 
end

arr = [7,1,0,5]
p great_two_sum?(arr, 6) #=> true
p great_two_sum?(arr, 10) #=> false

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your solutions and then call 
#over your TA and show them what you've got. Defend to them why each of your solutions has the time complexity you claim it does.

# Bonus (come back to this once you have completed windowed max range exercises)
# See if you can extend your solution of two_sum? to solve four_sum?