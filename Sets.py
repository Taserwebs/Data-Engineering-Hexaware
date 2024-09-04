# Creating a set of fruits
fruits = {"apple", "banana", "orange"}

# Adding an element to the set
fruits.add("grape")

# Removing an element from the set
fruits.remove("banana")

# Checking is an element is in the set
print("Is 'apple' in the set?","apple" in fruits)
print("Is 'banana' in the set?", "banana" in fruits)

# Length of the set
set_length = len(fruits)
print("Number of elements in the set:", set_length)

# Looping through the set
print("Set elements:")
for fruit in fruits:
    print(fruit)