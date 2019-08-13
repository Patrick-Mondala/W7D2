# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. 
#This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the 
#first string. Check if the second string is one of these.

# Hints:
def anagramI?(str1, str2)
    anagrams = str1.split("").permutation.to_a.map { |anagram| anagram.join("") }
    anagrams.include?(str2)
end

anagramI?("gizmo", "sally")
anagramI?("elvis", "lives")

#time O(n!)
#space O(n!)


# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string,
# find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. 
#The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??
def anagramII?(str1, str2)
    str2_arr = str2.split("")
    str1.each_char do |char|
        idx = str2_arr.index(char)
        return false if idx.nil?
        str2_arr.delete_at(idx)
    end
    str2_arr.empty?
end

# p anagramII?("gizmo", "zigom")
# p anagramII?("gizmo", "sally")

#time O(n^2)
#space O(n)

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
#The strings are then anagrams if and only if the sorted versions are the identical.

def anagramIII?(str1, str2)
    str1_arr = str1.split("")
    str2_arr = st2.split("")
    str1_arr.sort == str2_arr.sort
end

# p anagramII?("gizmo", "zigom")
# p anagramII?("gizmo", "sally")

# [0,1,2,3,4,5]
# [0,1,2]
# [0]

# What is the time complexity of this solution? Is it better or worse than #second_anagram??
# time O(nlogn)
# space O(n)

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears 
#in both words. Compare the resulting hashes.
def anagramIV?(str1, str2)
    str1_hash = Hash.new(0)
    str2_hash = Hash.new(0)

    str1.each_char do |char|
        str1_hash[char] += 1
    end

    str2.each_char do |char|
        str2_hash[char] += 1
    end

    str1_hash == str2_hash
end

p anagramIV?("gizmo", "zigom")
p anagramIV?("gizmo", "sally")

# What is the time complexity?
# time O(n)
# space O(n)

# Bonus: Do it with only one hash.
def anagramV?(str1, str2)
    count_hash = Hash.new(0)
    
    str1.each_char do |char|
        count_hash[char] += 1
    end

    str2.each_char do |char|
        count_hash[char] -= 1
    end
    
    count_hash.values.all?(0)
end

p anagramV?("gizmo", "zigom")
p anagramV?("gizmo", "sally")

# Discuss the time complexity of your solutions together, then call over your TA to look at them.